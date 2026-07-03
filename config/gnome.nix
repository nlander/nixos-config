{ pkgs, windowManager, ...}:
{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
       "switch-to-workspace-left" = ["<Alt>h"];
       "switch-to-workspace-right" = ["<Alt>l"];
       "move-to-workspace-left" = ["<Primary><Alt>h"];
       "move-to-workspace-right" = ["<Primary><Alt>l"];
    };
  };
}
