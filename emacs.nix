{ config, lib, pkgs, ... }:

{
  
  environment.systemPackages = with pkgs; [
    tdlib
    emacsPackages.mu4e
    emacs
    ripgrep
    coreutils
    fd 
    aspell aspellDicts.en
    zlib
    pkg-config
    libwebp
  ];
}
