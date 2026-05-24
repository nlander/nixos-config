{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      windowrulev2 = [
        "float, class:^(firefox)$, title:^(Extension:)(.*)$"
        "stayfocused, class:^(firefox)$, title:^(Extension:)(.*)$"
        "noborder, class:^(firefox)$, title:^(Extension:)(.*)$"
        "float, class:^(firefox)$, title:^$"
        "noborder, class:^(firefox)$, title:^$"
      ];

      monitor = [
        "HDMI-A-2, 1366x768@59.79, 0x0, 1"
        "eDP-1, 1920x1080@60.02, 1366x0, 1.5"
      ];

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

