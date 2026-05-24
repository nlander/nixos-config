{ pkgs, inputs, ... }:

let
  repoBuilder = pkgs.callPackage (
    { stdenv, fetchurl, lib }:
    args: inputs.firefox-addons.lib.${pkgs.system}.buildFirefoxXpiAddon (args // {
      inherit stdenv fetchurl lib;
    })
  ) { };
  addons = pkgs.callPackage "${inputs.firefox-addons}/default.nix" {
    buildMozillaXpiAddon = repoBuilder;
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
