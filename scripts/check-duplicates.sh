#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_NIX="$REPO_DIR/home-manager/home.nix"
OVERRIDES_FILE="$REPO_DIR/.brew-overrides"

# Parse nix package names from home.nix (lines like "pkgs.foo" or "pkgs.foo-bar")
nix_packages=$(grep -oE '^\s+pkgs\.[a-zA-Z0-9_-]+' "$HOME_NIX" | sed 's/.*pkgs\.//' | sort -u)

# Get brew formulae (excludes casks)
brew_packages=$(brew list --formula -1 2>/dev/null | sort -u)

# Load overrides (one package name per line)
overrides=()
if [[ -f "$OVERRIDES_FILE" ]]; then
  while IFS= read -r line; do
    line="${line%%#*}"   # strip comments
    line="${line// /}"   # strip whitespace
    [[ -n "$line" ]] && overrides+=("$line")
  done < "$OVERRIDES_FILE"
fi

is_override() {
  local pkg="$1"
  for o in "${overrides[@]+"${overrides[@]}"}"; do
    [[ "$pkg" == "$o" ]] && return 0
  done
  return 1
}

duplicates=()
for nix_pkg in $nix_packages; do
  if echo "$brew_packages" | grep -qx "$nix_pkg"; then
    if is_override "$nix_pkg"; then
      echo "ok: $nix_pkg (overridden)"
    else
      duplicates+=("$nix_pkg")
    fi
  fi
done

if [[ ${#duplicates[@]} -gt 0 ]]; then
  echo "duplicates found between brew and home-manager:"
  for d in "${duplicates[@]}"; do
    echo "  - $d"
  done
  echo ""
  echo "remove them with: brew uninstall ${duplicates[*]}"
  echo "or add to $OVERRIDES_FILE to allow"
  exit 1
fi

echo "no duplicates found"
