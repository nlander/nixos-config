{ pkgs, inputs, ... }:

let
  buildMozillaXpiAddon = pkgs.callPackage "${inputs.firefox-addons}/lib.nix" { };
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
