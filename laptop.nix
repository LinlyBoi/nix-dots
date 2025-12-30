{ config, lib, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.fprintd.enable = true; 
  # https://github.com/NixOS/nixpkgs/issues/149812
  environment.extraInit = ''
    export XDG_DATA_DIRS="$XDG_DATA_DIRS:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
  '';
  environment.systemPackages = with pkgs; [
    gnomeExtensions.just-perfection
  ];
  programs.dconf.profiles.user.databases = [
    {
      lockAll = true; # prevents overriding
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "purple";
        };
        "org/gnome/desktop/input-sources" = {
          xkb-options = [ "caps:escape" ];
        };
      };
    }
  ];
}
