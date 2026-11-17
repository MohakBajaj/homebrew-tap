#!/bin/bash
# Points Casks/jot.rb at the version in Jot's update manifest. Does nothing when it already is.
# The hourly workflow runs it, so a Jot release needs no step here.
set -euo pipefail
cd "$(dirname "$0")"
version=$(curl -fsS https://dl.sayjot.xyz/latest.json | jq -er .version)
[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "bad version: $version" >&2; exit 1; }
current=$(sed -n 's/^  version "\(.*\)"$/\1/p' Casks/jot.rb)
if [[ "$version" == "$current" ]]; then
  echo "already $version"
  exit 0
fi
sha=$(curl -fsS "https://dl.sayjot.xyz/v$version/SHA256SUMS" | awk -v f="Jot-$version.dmg" '$2 == f { print $1 }')
[[ "$sha" =~ ^[0-9a-f]{64}$ ]] || { echo "no checksum for Jot-$version.dmg" >&2; exit 1; }
# The dmg must be up and match before the cask points at it.
got=$(curl -fsSL "https://dl.sayjot.xyz/v$version/Jot-$version.dmg" | shasum -a 256 | awk '{ print $1 }')
[[ "$got" == "$sha" ]] || { echo "Jot-$version.dmg is $got, SHA256SUMS says $sha" >&2; exit 1; }
VERSION="$version" SHA="$sha" perl -pi -e 's/^  version ".*"$/  version "$ENV{VERSION}"/; s/^  sha256 ".*"$/  sha256 "$ENV{SHA}"/' Casks/jot.rb
echo "bumped $current -> $version"
