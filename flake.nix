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
    mkSystem = systemParameters: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs systemParameters; };
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
            extraSpecialArgs = { inherit inputs systemParameters; };
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
      lemur-gnome = mkSystem { windowManager = "gnome"; machine = "lemur"; };
      legion-gnome = mkSystem { windowManager = "gnome"; machine = "legion"; };
      owncast-server = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration-owncast.nix
        ];
      };
    };
  };
}
