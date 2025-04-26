{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      bind = [
        "SUPER, T, exec, kitty"
        "SUPER, F, exec, firefox"
        "ALT, TAB, cyclenext,"
        "ALT, SPACE, fullscreen, 0"
        "ALT, L, workspace, +1"
        "ALT, H, workspace, -1"
        "ALT CONTROL, L, movetoworkspace, +1"
        "ALT CONTROL, H, movetoworkspace, -1"
        "ALT SHIFT, L, movetoworkspacesilent, +1"
        "ALT SHIFT, H, movetoworkspacesilent, -1"
      ];
    };
  };
}

