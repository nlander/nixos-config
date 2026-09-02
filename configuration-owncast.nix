# configuration-owncast.nix
{ config, pkgs, inputs, ... }:

{
  imports = [
    ./machines/owncast-server/hardware-configuration.nix
  ];
  # Basic System Settings
  networking.hostName = "owncast-server";
  time.timeZone = "America/Guayaquil";
  i18n.defaultLocale = "en_US.UTF-8";

  # Nix Settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://elodie.cachix.org" ];
    trusted-public-keys = [ "elodie.cachix.org-1:gM/2+RR2gQol5czMn/3qBMGiAunacuwyEVq5+5MFCPM=" ];
  };

  # Networking & Firewall
  networking.useNetworkd = true;
  services.openssh.enable = true;
  
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 1935 ]; # SSH, HTTP, HTTPS, RTMP
  };

  # Owncast Service
  services.owncast = {
    enable = true;
  };

  # Optional: Caddy reverse proxy for HTTPS
  services.caddy = {
    enable = true;
    virtualHosts."watch.elodielander.stream" = {
      extraConfig = ''
        reverse_proxy localhost:8080
      '';
    };
  };

  # Minimal System Packages
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    wget
  ];

  # Boot Loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.11";
}
