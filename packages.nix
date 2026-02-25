{ config, lib, pkgs, ... }:

{
  # Allow unfree packages
nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import <unstable> {
        config = config.nixpkgs.config;
      };
    };
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  vim
  wget
  ranger
  mpv ffmpeg
  adw-gtk3
  bitwarden-desktop
  chezmoi
  darkman
  nextcloud-talk-desktop
  hledger
  supersonic
  libdrm
  yt-dlp freetube
  prismlauncher
  nextcloud-client
  discord-canary
  firefox-gnome-theme
  gimp
  less
  unzip
  zip
  file
  man-pages
  man-pages-posix
  libreoffice-fresh
  ledger
  ];
  programs.steam.enable = true;
  programs.firefox.enable = true;
  fonts.packages = with pkgs; [ miracode ];
}
