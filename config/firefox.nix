{ pkgs, inputs, ... }:

let
  addons = inputs.firefox-addons.lib.${pkgs.system}.fromNixpkgs pkgs;
in
{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        addons.lastpass-password-manager
      ];
    };
  };
}
