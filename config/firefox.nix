{ pkgs, inputs, firefox-addons-allowUnfree, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions = with firefox-addons-allowUnfree; [
        lastpass-password-manager
      ];
    };
  };
}
