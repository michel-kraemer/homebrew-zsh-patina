#!/usr/bin/env -S deno run --allow-net --allow-read --allow-write

import { Octokit } from "npm:@octokit/rest@22"

const FORMULA_PATH = new URL("./Formula/zsh-patina.rb", import.meta.url)

const octokit = new Octokit()

// fetch latest stable release
const { data: release } = await octokit.repos.getLatestRelease({
  owner: "michel-kraemer",
  repo: "zsh-patina",
})
const tag = release.tag_name
console.log(`Latest release: ${tag}`)

// read formula and check current version
const formula = await Deno.readTextFile(FORMULA_PATH)
const currentTag = formula.match(/releases\/download\/([^/]+)\//)?.[1]

if (!currentTag) {
  console.error("Could not determine current version from formula.")
  Deno.exit(1)
}

if (currentTag === tag) {
  console.log(`Formula is already up to date (version ${tag}).`)
  Deno.exit(0)
}

console.log(`Updating formula: ${currentTag} -> ${tag}`)

const aarch64 = release.assets.find(a =>
  a.name.includes("aarch64-apple-darwin"),
)
const x86 = release.assets.find(a => a.name.includes("x86_64-apple-darwin"))

if (!aarch64 || !x86) {
  console.error("Could not find macOS assets for this release.")
  Deno.exit(1)
}

const aarch64Sha = aarch64.digest!.replace("sha256:", "")
const x86Sha = x86.digest!.replace("sha256:", "")

console.log(`${aarch64.name}: ${aarch64Sha}`)
console.log(`${x86.name}: ${x86Sha}`)

// extract current SHA256 values from the formula
const currentAarch64Sha = formula.match(
  /aarch64-apple-darwin[^\n]*\n\s*sha256 "([a-f0-9]{64})"/,
)?.[1]
const currentX86Sha = formula.match(
  /x86_64-apple-darwin[^\n]*\n\s*sha256 "([a-f0-9]{64})"/,
)?.[1]

if (!currentAarch64Sha || !currentX86Sha) {
  console.error("Could not parse current SHA256 values from formula.")
  Deno.exit(1)
}

// apply all substitutions and write back
const updated = formula
  .replace(
    /releases\/download\/[^/]+\/[^"]*aarch64[^"]*\.tar\.gz/,
    `releases/download/${tag}/${aarch64.name}`,
  )
  .replace(
    /releases\/download\/[^/]+\/[^"]*x86_64[^"]*\.tar\.gz/,
    `releases/download/${tag}/${x86.name}`,
  )
  .replace(currentAarch64Sha, aarch64Sha)
  .replace(currentX86Sha, x86Sha)

await Deno.writeTextFile(FORMULA_PATH, updated)
console.log(`Formula updated successfully to ${tag}.`)
