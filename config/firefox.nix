{ pkgs, inputs, ... }:

let
  repoBuilder = inputs.firefox-addons.lib.${pkgs.system}.buildFirefoxXpiAddon;
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
