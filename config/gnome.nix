{ pkgs, windowManager, ...}:
{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
       "switch-applications-backward" = ["<Alt>h"];
       "switch-applications" = ["<Alt>m"];
       "move-to-workspace-left" = ["<Primary><Alt>h"];
       "move-to-workspace-right" = ["<Primary><Alt>l"];
       "toggle-fullscreen" = ["<Alt>F11"];
    };
    "org/gnome/desktop/interface" = {
       "cursor-theme" = "Breeze_Hacked";
       "cursor-size" = 32;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = 2500;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 0.0;
      night-light-schedule-to = 0.0;
    };
  };
}
