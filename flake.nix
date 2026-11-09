{
  description = "My nix flake for my machines";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      mkHost =
        {
          hostname,
          system ? "x86_64-linux",
          modules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./host/${hostname} ] ++ modules;
        };
    in
    {
      nixosConfigurations = {

        laptop = mkHost {
          hostname = "laptop";
          modules = [
            ./modules/niri.nix
            ./modules/packages.nix
            ./modules/emacs.nix
            ./modules/apple-cursor.nix
            ./modules/dev-pkgs.nix
            ./modules/mariadb.nix
            ./modules/tailscale.nix
          ];
        };

        desktop = mkHost {
          hostname = "desktop";
          modules = [
            ./modules/niri.nix
            ./modules/storage.nix
          ];
        };

      };
    };
}
