{ config, lib, pkgs, ... }:

{
  
  environment.systemPackages = with pkgs; [
    unstable.tdlib
    emacsPackages.mu4e
    emacs
    ripgrep
    coreutils
    fd 
    aspell aspellDicts.en
    zlib
    pkg-config
    libwebp
    imagemagick
    offlineimap
  ];
}
