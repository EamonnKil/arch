-- Docs: https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- To check class name, open the app and run:
-- hyprctl clients

hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true,
    ignore_alpha = 0.15,
})

hl.layer_rule({
    match = { namespace = "bar" },
    blur = true,
    ignore_alpha = 0.15,
})

hl.window_rule({
    name = "gnome-text-editor-blur",
    match = { class = "^(org.gnome.TextEditor|gnome-text-editor)$" },
    opacity = "0.8 override",
})

-- Opacity rules for all windows except fullscreen
hl.window_rule({
    match = { class = ".*" },
    opacity = "0.6 override",
})
hl.window_rule({
    match = { class = ".*", fullscreen = true },
    opacity = "1.0 override",
})

-- Keep the HyprMod configuration window readable when global opacity changes.
hl.window_rule({
    name = "hyprmod-opaque",
    match = { class = "(?i)hyprmod" },
    opacity = "1.0 override",
})

--hl.window_rule({
--    name = "brave-opaque",
--    match = { class = "^brave-browser$" },
--    opacity = "1.0 override",
--})

hl.window_rule({
    name = "file-picker-float",
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    float = true,
    center = true,
    size = "900 600",
})

hl.window_rule({
    match = { class = "kitty" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "float-pavucontrol",
    match = { class = "^(pavucontrol)$" },
    float = true,
})

hl.window_rule({
    name = "float-nm-connection-editor",
    match = { class = "^(nm-connection-editor)$" },
    float = true,
})

hl.window_rule({
    name = "float-blueman-manager",
    match = { class = "^(blueman-manager)$" },
    float = true,
})

hl.window_rule({
    name = "float-open-file",
    match = { title = "^(Open File)$" },
    float = true,
})

hl.window_rule({
    name = "float-save-file",
    match = { title = "^(Save File)$" },
    float = true,
})
hl.window_rule({
    name = "zen-nrowser",
    match = { class = "^(zen|zen-browser)$" },
    opacity = "1.0 override",
})
