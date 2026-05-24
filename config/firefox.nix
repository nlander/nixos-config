{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        pkgs.nur.repos.rycee.firefox-addons.lastpass-password-manager
      ];
    };
  };
}
