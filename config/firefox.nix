{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        (pkgs.callPackage "${inputs.firefox-addons}/default.nix" {
          buildMozillaXpiAddon = pkgs.buildFirefoxXpiAddon;
        }).lastpass-password-manager
      ];
    };
  };
}
