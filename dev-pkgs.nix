{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
  python315 graphviz
  texliveFull
  rustup gcc go
  cmake gnumake 
  trunk slumber
  direnv
  ];
}
