{ pkgs, lib, ... }:

{
  # 1. Install apple-cursor system-wide
  environment.systemPackages = with pkgs; [
    apple-cursor
    dconf
  ];

  # 2. Export environment variables
  environment.sessionVariables = {
    XCURSOR_THEME = "macOS";
    XCURSOR_SIZE = "24";
  };

  # 3. Apply settings via dconf for GTK/Flatpak apps
  programs.dconf.enable = true;
  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/interface" = {
          cursor-theme = "macOS";
          cursor-size = lib.gvariant.mkInt32 24;
        };
      };
    }
  ];

  # 4. Fallback symlink for legacy XWayland/X11 apps
  environment.etc."icons/default/index.theme".text = ''
    [Icon Theme]
    Name=Default
    Comment=Default Cursor Theme
    Inherits=macOS
  '';
}
