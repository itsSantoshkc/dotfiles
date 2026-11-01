-- hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)



hl.on("hyprland.start", function () 
  hl.exec_cmd("clipse -listen")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("waybar & hyprpaper & swaync & hypridle")
end)