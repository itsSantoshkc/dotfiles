-------------------
---- VARIABLES ----
-------------------

-- Set these to match your hyprland.lua (or require them from there)
local terminal    = "ghostty"        -- whatever $terminal was
local fileManager = "nautilus"       -- whatever $fileManager was
local menu        = "rofi"           -- whatever $menu was (must support -show)
local mainMod     = "SUPER"

local home = os.getenv("HOME")


-- Apps / session
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu .. " -show window"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pkill waybar && waybar &"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave-browser"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu .. " -show drun"))
hl.bind(mainMod .. " + CONTROL + P", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/power_script.sh"))
hl.bind("Print", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/satty-screenshot.sh"))
hl.bind(mainMod .. " + CONTROL + V", hl.dsp.exec_cmd("ghostty --title=clipse --class=clipse -e clipse"))

-- Move focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces 1-10 (key 0 -> workspace 10)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume / brightness (bindel = locked + repeating)
local lr = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), lr)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), lr)
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), lr)
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), lr)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), lr)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), lr)

-- Media (bindl = locked)
local l = { locked = true }
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"), l)
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), l)
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), l)
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"), l)