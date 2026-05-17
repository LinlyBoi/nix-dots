{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.gnome.gnome-keyring.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.logitech.wireless.enable = true;
  services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [
    gsettings-desktop-schemas
    zathura
    i3status
    grim
    slurp
    wl-clipboard
    wofi
    mako
    wezterm
    pwvucontrol
    playerctl
    piper
    logiops
  ];
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
