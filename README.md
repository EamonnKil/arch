## arch. a minimal, productive arch linux setup.


![Wallpaper preview](wallpapers/wallhaven-6lermx.png)

<details>
<summary><b>What is this? What do I need?</b></summary>

### What is this?

This is a full customizable desktop setup for Linux. (bar, app launcher, settings, wallpaper picker, lock screen, power menu, etc). It's built on **Hyprland** (window manager) and **Quickshell** (what the bar and menus are made with). 

### What do I need to run it?

- An **Arch-based Linux distro**: Arch, CachyOS, EndeavourOS, Manjaro, etc.
- A mostly **clean installation**. Existing configs that get replaced are backed up automatically.

### Is it hard to use?

Not really. Almost everything is a keyboard shortcut, with mouse alternatives:

- `Super + I` - Open settings - `Middle-click the clock` 

Check other [Keybinds](#keybinds). You can also hover over bar elements to see what they do

### What should I know before installing?

- Log out and back in once the installer finishes.
- Wallpapers aren't included in the install. Download some and put them in `Pictures/Wallpapers`.

</details>

A clean and minimal fork of 43PR's existing hyprland + quickshell configs.

## Install Arch

1. Go through https://wiki.archlinux.org/title/Installation_guide
2. Install Git and an AUR helper if you use the foreign package list (for example, `sudo pacman -S --needed git base-devel`, then install `yay` or `paru` using the Arch Wiki instructions).
3. Clone this repository and run:

```sh
sudo pacman -Syu --needed git base-devel
git clone https://github.com/EamonnKil/arch.git ~/arch
cd ~/arch
bash install.sh
```

## Updating

After editing configs in this repository:

```sh
git status
git diff
git add .
git commit -m "Update dotfiles"
git push
```

## What's installed?

`assets/cursors/W11-Cursor-Dark/` contains a clean, dark cursor theme, and `wallpapers/` contains 46 dark wallpapers. If you want to add/remove any, go to /home/YOURUSERNAME/Pictures/Wallpapers/

## Applications

**Super + T** - Open terminal

**Super + D** - Toggle application launcher (Rofi)

**Super + X** - Toggle wheel launcher

**Super + E** - Open file manager

**Super + B** - Open Zen Browser

**Super + M** - Open Spotify

**Super + O** - Open Obsidian

**Super + S** - Open Steam

**Super + C** - Open ChatGPT

**Super + L** - Open LocalSend

## Window Management

**Super + Q** - Close active window

**Super + F** - Toggle fullscreen

**Super + Space** - Toggle floating window, resize to 70% of the monitor and centre it

**Super + Left Mouse Button** - Drag window

**Super + Right Mouse Button** - Resize window

**Super + O** - Toggle window opacity

## System Controls

**Super + Tab** - Lock screen

**Super + Grave (`)** - Toggle power menu

**Super + I** - Toggle settings

**Super + L** - Toggle light/dark theme

**Super + A** - Toggle notifications

**Super + H** - Toggle to-do panel

**Super + Shift + W** - Toggle bar

## Appearance and Customisation

**Super + W** - Open wallpaper selector

**Super + Shift + C** - Open colour picker

**Super + N** - Toggle opacity settings

## Screenshots and Recording

**Delete** - Take fullscreen screenshot, save it to `~/Pictures/` and copy it to the clipboard

**Shift + Delete** - Select an area for a screenshot, save it to `~/Pictures/` and copy it to the clipboard

**Super + R** - Toggle GPU screen recording

## Clipboard

**Super + V** - Open clipboard history (Rofi)

## Keyboard

**Super + X** - Switch to the next keyboard layout

## Cursor Zoom

**Super + Scroll Down** - Zoom out

**Super + Scroll Up** - Zoom in
