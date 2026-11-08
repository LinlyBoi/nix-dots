{
  config,
  lib,
  pkgs,
  ...
}:

{

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
            ./modules/laptop-niri.nix
          ];
        };

        desktop = mkHost {
          hostname = "desktop";
          modules = [
          ];
        };

      };
    };
}
