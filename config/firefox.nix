{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        lastpass-password-manager
      ];
    };
  };
}
