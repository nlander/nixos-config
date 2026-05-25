{ pkgs, config, ... }:

{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
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
