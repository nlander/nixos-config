{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        inputs.nur.repos.rycee.firefox-addons.lastpass-password-manager
      ];
    };
  };
}
