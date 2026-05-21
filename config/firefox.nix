{ pkgs, inputs, ... }:

let
  firefox-pkgs = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        firefox-pkgs.lastpass-password-manager
      ];
    };
  };
}
