{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
  opencode
  python315 graphviz
  texliveFull
  rustup gcc go
  cmake gnumake 
  trunk slumber
  ];
  programs.direnv.enable = true;
}
