{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        (pkgs.callPackage "${inputs.firefox-addons}/default.nix" {
          buildMozillaXpiAddon = inputs.firefox-addons.lib.${pkgs.system}.buildFirefoxXpiAddon;
          pkgs.config = pkgs.config;
        }).lastpass-password-manager
      ];
    };
  };
}
