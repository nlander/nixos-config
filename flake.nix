{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tmux-paste.url = "github:nlander/tmux-paste";
    debug-files.url = "github:nlander/debug-files";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    mkSystem = windowManager: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs windowManager; };
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        {
          nixpkgs.config.allowUnfree = true;
          nixpkgs.overlays = [ inputs.nur.overlays.default ];
          # Home Manager
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs windowManager; };
            backupFileExtension = "backup";
            users = {
              "elodie" = import ./home.nix;
            };
          };
        }
      ];
    };
  in {
    nixosConfigurations = {
      gnome = mkSystem "gnome";
      hyprland = mkSystem "hyprland";
    };
  };
}
