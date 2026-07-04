{
  config,
  lib,
  pkgs,
  ...
}:

{
services.greetd = {                                                      
  enable = true;                                                         
  settings = {                                                           
    default_session = {                                                  
      command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
      user = "greeter";                                                  
    };                                                                   
  };                                                                     
};
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
  # xdg portal + pipewire = screensharing
  xdg = {
    portal = {
      enable = true;
      wlr = {
        enable = true;
        settings = {
          screencast = {
            chooser_type = "simple";
            chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
          };
        };
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
}
