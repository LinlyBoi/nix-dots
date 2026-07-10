{
  config,
  lib,
  pkgs,
  ...
}:

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
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
  environment.systemPackages = with pkgs; [
    vim
    wget
    ranger
    mpv
    ffmpeg
    adw-gtk3
    bitwarden-desktop
    chezmoi
    darkman
    nextcloud-talk-desktop
    hledger
    supersonic
    libdrm
    yt-dlp
    freetube
    prismlauncher
    nextcloud-client
    # discord-canary
    vesktop
    firefox-gnome-theme
    chromium
    gimp
    unstable.krita
    less
    unzip
    zip
    file
    man-pages
    man-pages-posix
    libreoffice-fresh
    ledger
    xournalpp
    ytfzf
  ];
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
  programs.firefox.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    miracode
    rubik
  ];
  programs.chromium = {
    enable = true;
    extraOpts = {
      "BrowserSignin" = 0;
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
    };
  };
  services.cloudflare-warp.enable = true;
}
