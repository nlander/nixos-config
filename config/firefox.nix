{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        (pkgs.callPackage "${inputs.firefox-addons}/generated-firefox-addons.nix" {
          buildMozillaXpiAddon = inputs.firefox-addons.lib.${pkgs.system}.buildFirefoxXpiAddon;
        }).lastpass-password-manager
      ];
    };
  };
}
