{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        (pkgs.callPackage "${inputs.firefox-addons}/default.nix" { }).lastpass-password-manager
      ];
    };
  };
}
