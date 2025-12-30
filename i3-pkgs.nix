{ config, lib, pkgs, ... }:

{
  
  environment.systemPackages = with pkgs; [
    dunst
    flameshot 
    wezterm
    rofi
    playerctl
    pavucontrol
  ];
}
