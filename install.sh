#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
home_dir="${HOME:?HOME is not set}"
backup_root="${XDG_STATE_HOME:-$home_dir/.local/state}/personal-dotfiles/backups/$(date +%Y%m%d-%H%M%S)"

if [[ ! -f /etc/arch-release ]]; then
  echo "This installer expects Arch Linux." >&2
  exit 1
fi
command -v pacman >/dev/null || { echo "pacman is required." >&2; exit 1; }

mapfile -t repo_packages < <(sed '/^[[:space:]]*#/d; /^[[:space:]]*$/d' "$repo_dir/packages/pacman-explicit.txt")
mapfile -t foreign_packages < <(sed '/^[[:space:]]*#/d; /^[[:space:]]*$/d' "$repo_dir/packages/foreign-explicit.txt")

if ((${#repo_packages[@]})); then
  echo "Installing ${#repo_packages[@]} official repository packages (this performs a full system upgrade)."
  sudo pacman -Syu --needed "${repo_packages[@]}"
fi

if ((${#foreign_packages[@]})); then
  aur_helper=""
  if command -v paru >/dev/null; then aur_helper=paru; elif command -v yay >/dev/null; then aur_helper=yay; fi
  if [[ -n "$aur_helper" ]]; then
    echo "Installing ${#foreign_packages[@]} foreign packages with $aur_helper. Review prompts carefully."
    "$aur_helper" -S --needed "${foreign_packages[@]}"
  else
    echo "No yay/paru found; skipping foreign packages. Install an AUR helper, review packages/foreign-explicit.txt, then install those packages manually." >&2
  fi
fi

backup_if_needed() {
  local src="$1" dest="$2" rel="$3"
  mkdir -p "$(dirname -- "$dest")"
  if [[ -L "$dest" ]] && [[ "$(readlink -f -- "$dest" 2>/dev/null || true)" == "$(readlink -f -- "$src")" ]]; then
    return 0
  fi
  if [[ -e "$dest" || -L "$dest" ]]; then
    local saved="$backup_root/$rel"
    mkdir -p "$(dirname -- "$saved")"
    mv -- "$dest" "$saved"
    echo "Saved existing $dest to $saved"
  fi
  ln -s -- "$src" "$dest"
}

while IFS= read -r -d '' src; do
  rel="${src#"$repo_dir/"}"
  [[ "$rel" == ".config/.zshrc" ]] && continue
  backup_if_needed "$src" "$home_dir/$rel" "$rel"
done < <(find "$repo_dir/.config" -type f -not -path '*/.git/*' -print0)

if [[ -f "$repo_dir/.config/.zshrc" ]]; then
  backup_if_needed "$repo_dir/.config/.zshrc" "$home_dir/.zshrc" ".zshrc"
fi

# Install the bundled cursor theme as a repo-backed link; preserve any existing theme.
if [[ -d "$repo_dir/assets/cursors/W11-Cursor-Dark" ]]; then
  backup_if_needed "$repo_dir/assets/cursors/W11-Cursor-Dark" \
    "$home_dir/.local/share/icons/W11-Cursor-Dark" ".local/share/icons/W11-Cursor-Dark"
fi

# Copy wallpapers only when absent because wallpaper tools may rename/delete them.
if [[ -d "$repo_dir/wallpapers" ]]; then
  while IFS= read -r -d '' src; do
    rel="${src#"$repo_dir/wallpapers/"}"
    dest="$home_dir/Pictures/Wallpapers/$rel"
    if [[ ! -e "$dest" && ! -L "$dest" ]]; then
      mkdir -p "$(dirname -- "$dest")"
      cp -n -- "$src" "$dest"
    fi
  done < <(find "$repo_dir/wallpapers" -type f -print0)
fi

echo "Dotfiles, cursor theme, and missing wallpapers installed. Existing conflicts, if any, are backed up under $backup_root"
echo "Log out and back in to start the configured desktop session."
