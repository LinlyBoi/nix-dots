{
  config,
  lib,
  pkgs,
  ...
}:

{

  environment.systemPackages = with pkgs; [
    unstable.tdlib
    libtool
    libvterm
    emacsPackages.mu4e
    emacs-pgtk
    ripgrep
    coreutils
    fd
    aspell
    aspellDicts.en
    zlib
    pkg-config
    libwebp
    imagemagick
    offlineimap
  ];
}
