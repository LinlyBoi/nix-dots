{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  zathura
  wezterm
  pwvucontrol
  playerctl 
  ];
}
