{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      settings = {
        "browser.startup.page" = 3; # reload previous tabs
        "browser.startup.homepage" = "about:home";
        "widget.wayland.use-move-to-rect" = false;
      };
      extensions.packages = [
        pkgs.nur.repos.rycee.firefox-addons.lastpass-password-manager
      ];
    };
  };
}
