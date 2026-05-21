{ pkgs, inputs, ... }:

let
  unfree-addons = import inputs.firefox-addons {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };
in
{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions = [
        unfree-addons.packages."x86_64-linux".lastpass-password-manager
      ];
    };
  };
}
