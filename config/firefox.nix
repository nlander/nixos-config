{ pkgs, inputs, ... }:

let
  addons = (pkgs.extend (final: prev: {
    buildMozillaXpiAddon = inputs.firefox-addons.lib.${pkgs.system}.buildFirefoxXpiAddon;
  })).callPackage "${inputs.firefox-addons}/default.nix" { };
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
