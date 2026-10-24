{
  config,
  lib,
  pkgs,
  ...
}:

{
 hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
        intel-compute-runtime
        intel-vaapi-driver
        intel-media-driver
    ];
  };
services.greetd = {                                                      
  enable = true;                                                         
  settings = {                                                           
    default_session = {                                                  
      command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
      user = "greeter";                                                  
    };                                                                   
  };                                                                     
};
  security.pam.services.greetd.fprintAuth = false;
  programs.niri.enable = true;
  systemd.user.services.niri.enableDefaultPath = false;
  services.fprintd.enable = true;
  # https://github.com/NixOS/nixpkgs/issues/149812
  environment.extraInit = ''
    export XDG_DATA_DIRS="$XDG_DATA_DIRS:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
  '';
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = { };
  security.pam.services.login.enableGnomeKeyring = true;
  # If using greetd/tuigreet or another non-GDM greeter, also add:
  security.pam.services.greetd.enableGnomeKeyring = true;

  programs.waybar.enable = true; # top bar
  environment.systemPackages = with pkgs; [
    wezterm
    fuzzel
    swaylock
    mako
    pwvucontrol
    libnotify
    swayidle
    adw-gtk3
    glib
    gsettings-desktop-schemas
    xwayland-satellite
    nautilus
    playerctl
    brightnessctl
    wrapGAppsHook4
    zathura
  ];
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common.default = "*";
  };
}
