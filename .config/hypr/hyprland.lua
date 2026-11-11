-- ~/.config/hypr/hyprland.lua
-- Docs: https://wiki.hypr.land/Configuring/Start/

---- MY PROGRAMS ----

mainMod    = "SUPER"
terminal   = "kitty"
menu       = "rofi -show drun"
fileManager = "thunar"
browser    = "zen"

---- AUTOSTART ----

hl.on("hyprland.start", function()
    -- hl.exec_cmd("dunst") replaced with quickshell 
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper-restore.sh")
    hl.exec_cmd("sleep 2 && QSG_RENDER_LOOP=basic qs")
end)

---- ENVIRONMENT VARIABLES ----

hl.env("XCURSOR_THEME", "W11-Cursor-Dark")
hl.env("XCURSOR_SIZE", "32")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")

---- INPUT ----

hl.config({
    input = {
        kb_layout = "gb, us",
        follow_mouse = 1,
        sensitivity = 0.3,
        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
        },
    },
})

-- LAYOUT

-- Give Zen a full-width scrolling column
hl.window_rule({
    name = "browser-scrolling-width",
    match = {
        class = "zen",
    },
    scrolling_width = 1.0,
})

-- Global layout settings
hl.config({
    general = {
        layout = "dwindle",
    },
    scrolling = {
        fullscreen_on_one_column = false,
        column_width = 0.5,
        direction = "right",
        follow_focus = 1,
    },
})

-- Workspace 1 scrolling configuration
hl.workspace_rule({
    workspace = "1",
    layout = "scrolling",
    gaps_out = {
        top = 5,
        right = 4,
        bottom = 8,
        left = 4,
    },
})

hl.config({
    master = { new_status = "master" },
})



-- MISC
hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
})
---- SPLIT-OUT FILES ----

require("monitors")
require("keybinds")
require("look")
require("rules")

-- HyprMod managed settings
require("hyprland-gui")

hl.workspace_rule({
    workspace = "1",
    layout = "scrolling",
    gaps_out = {
        top = 5,
        right = 4,
        bottom = 8,
        left = 4,
    },
})
