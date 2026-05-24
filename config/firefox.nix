{ pkgs, inputs, ... }:

let
  buildMozillaXpiAddon = pkgs.callPackage (
    { stdenv, fetchurl, lib }:
    inputs.firefox-addons.lib.${pkgs.system}.buildFirefoxXpiAddon {
      inherit stdenv fetchurl lib;
    }
  ) { };
  addons = pkgs.callPackage "${inputs.firefox-addons}/default.nix" {
    inherit buildMozillaXpiAddon;
  };
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
