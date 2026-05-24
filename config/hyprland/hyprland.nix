{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      source = ${./hyprland.lua}
    '';
  };
}

