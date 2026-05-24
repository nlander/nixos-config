{ pkgs, inputs, ... }:

let
  buildMozillaXpiAddon = pkgs.callPackage "${pkgs.path}/pkgs/build-support/firefox/addons.nix" { };
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
