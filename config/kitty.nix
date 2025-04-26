{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      size = 24;
      name = "DejaVu Sans";
    };
    settings = {
      scrollback_lines = 50000;
      enable_audio_bell = false;
    };
    shellIntegration.enableFishIntegration = true;
  };
}
