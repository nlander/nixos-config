{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      bind = [
        "SUPER, T, exec, kitty"
        "SUPER, F, exec, firefox"
      ];
    };
  };
}

