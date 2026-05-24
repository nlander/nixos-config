{ pkgs, inputs, ... }:

let
  nur = pkgs.callPackage "${inputs.nur-expressions}/default.nix" { };
in
{
  programs.firefox = {
    enable = true;
    profiles.elodie = {
      extensions.packages = [
        nur.firefox-addons.lastpass-password-manager
      ];
    };
  };
}
