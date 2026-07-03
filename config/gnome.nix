{ pkgs, windowManager, ...}:
{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
       "switch-applications-backward" = ["<Alt>h"];
       "switch-applications" = ["<Alt>l"];
       "move-to-workspace-left" = ["<Primary><Alt>h"];
       "move-to-workspace-right" = ["<Primary><Alt>l"];
       "toggle-fullscreen" = ["<Alt>F11"];
    };
    "org/gnome/desktop/interface" = {
       "cursor-theme" = "Breeze_Hacked";
       "cursor-size" = 32;
    };
  };
}
