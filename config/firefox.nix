{ pkgs, inputs, ... }:

let
  repoBuilder = pkgs.callPackage "${pkgs.path}/pkgs/build-support/firefox/mk-xpi-addon.nix" {
    inherit (pkgs) stdenv fetchurl;
  };
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
