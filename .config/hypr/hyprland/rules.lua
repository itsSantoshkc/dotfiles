---------------------
---- WINDOW RULES ----
---------------------


local half = "(monitor_w*.45) (monitor_h*.45)"

-- Floating + centered file dialogs
local dialog_titles = {
    "^(Open File)(.*)$",
    "^(Select a File)(.*)$",
    "^(Open Folder)(.*)$",
    "^(Save As)(.*)$",
    "^(Library)(.*)$",
    "^(File Upload)(.*)$",
    "^(.*)(wants to save)$",
    "^(.*)(wants to open)$",
    "^(.*)(All Files)$",
}
for i, title in ipairs(dialog_titles) do
    hl.window_rule({
        name   = "dialog-" .. i,
        match  = { title = title },
        float  = true,
        center = true,
    })
end

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name   = "choose-wallpaper",
    match  = { title = "^(Choose wallpaper)(.*)$" },
    float  = true,
    center = true,
    size   = "(monitor_w*.60) (monitor_h*.65)",
})

hl.window_rule({
    name   = "onlyoffice-desktopeditors-center",
    match  = { class = "DesktopEditors" },
    center = true,
})

-- Utility windows: float + 45% size + center
local utility_classes = {
    "^(pavucontrol)$",
    "^(org.pulseaudio.pavucontrol)$",
    "^(nm-connection-editor)$",
    "^(blueman-manager)$",
    "^(org.gnome.Calendar)$",
    "^(org.gnome.Calculator)$",
    "^(jetbrains-toolbox)$",
}
for i, class in ipairs(utility_classes) do
    hl.window_rule({
        name   = "utility-" .. i,
        match  = { class = class },
        float  = true,
        size   = half,
        center = true,
    })
end

-- Title-matched utility windows
hl.window_rule({
    name   = "clipse",
    match  = { title = "^(clipse)$" },
    float  = true,
    size   = half,
    center = true,
})

hl.window_rule({
    name   = "picture-in-picture",
    match  = { title = "^(Picture in picture)$" },
    float  = true,
    size   = half,
    center = true,
})

-- Float only
local float_only = {
    { class = ".*plasmawindowed.*" },
    { class = "kcm_.*" },
    { class = ".*bluedevilwizard" },
    { title = ".*Welcome" },
    { title = "^(illogical-impulse Settings)$" },
    { title = ".*Shell conflicts.*" },
}
for i, m in ipairs(float_only) do
    hl.window_rule({
        name  = "float-only-" .. i,
        match = m,
        float = true,
    })
end

-- Opacity
local opaque_classes = {
    "org.gnome.Ptyxis",
    "brave-browser",
    "org.gnome.Showtime",
    "PacketTracer",
    "ONLYOFFICE",
}

for i, class in ipairs(opaque_classes) do
    hl.window_rule({
        name    = "opaque-" .. i,
        match   = { class = class },
        opacity = 100,
    })
end