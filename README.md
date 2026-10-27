## arch. a minimal, productive arch linux setup.


![Wallpaper preview](wallpapers/wallhaven-6lermx.png)

Personalized from an existing 43PR Hyprland setup. The original MIT license is retained in `LICENSE` because this repository includes 43PR files. Config files are stored in `.config/`; package snapshots and system notes are separate. Review every change before pushing, and keep this repository **private** unless you have audited it for personal data.

## Fresh Arch install

1. Install a base system with working network access and create your user.
2. Install Git and an AUR helper if you use the foreign package list (for example, `sudo pacman -S --needed git base-devel`, then install `yay` or `paru` using the Arch Wiki instructions).
3. Clone this private repository and run:

```sh
git clone <your-private-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installer installs the saved official-repository package list, installs the saved foreign package list when `yay` or `paru` is available, links the configs and W11 cursor theme, and copies bundled wallpapers that are not already present. Existing files that conflict are moved into a timestamped backup under `~/.local/state/personal-dotfiles/backups/` before links are created. Re-running it is safe for links already pointing into this repository. The official package step performs a full system upgrade, as Arch expects. Review the installer before running it on another machine.

## Updating

After editing configs in this repository:

```sh
git status
git diff
git add .
git commit -m "Update dotfiles"
git push
```

## Package and system snapshots

`assets/cursors/W11-Cursor-Dark/` contains your cursor theme, and `wallpapers/` contains the current 51-file wallpaper collection. The installer backs up a conflicting cursor directory and never overwrites an existing wallpaper. `packages/pacman-explicit.txt` lists explicitly installed official repository packages; `packages/foreign-explicit.txt` lists explicitly installed foreign packages (often AUR, but review each entry). These are snapshots and should be refreshed after intentional package changes.

`system/` contains basic OS, kernel, and disk notes; the service inventory could not be captured in this environment. It is reference information, not a system image. It does not back up personal files, application profiles, secrets, bootloader state, or the full operating system. Keep a separate encrypted backup of personal data and a separate full-system recovery plan.

## Secrets

Never commit passwords, API keys, browser data, private keys, tokens, cookies, or runtime state. The ignore rules are a safety net, not a substitute for reviewing `git status` and diffs before each push.
