{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        inputs.firefox-addons.packages.${pkgs.system}.lastpass-password-manager
      ];
    };
  };
}
