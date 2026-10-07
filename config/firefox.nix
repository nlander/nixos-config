{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      settings = {
        "browser.startup.page" = 3; # reload previous tabs
        "browser.startup.homepage" = "about:home";
        "widget.wayland.use-move-to-rect" = false;
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "intl.accept_languages" = "es-ES, es, en-US, en";
        "layout.spellcheckDefault" = 1;
        "browser.translations.enable" = true;
        "browser.translations.automaticallyPopup" = false;
        "spellchecker.dictionary" = "es-ES";
      };
      dictionaries = [ "es-ES" ];
      extensions.packages = [
        pkgs.nur.repos.rycee.firefox-addons.lastpass-password-manager
      ];
    };
  };
}
