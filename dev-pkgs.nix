{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    opencode
    python315
    graphviz
    texliveFull
    rustup
    gcc
    go
    cmake
    gnumake
    trunk
    slumber
    nixfmt
    nil
    jdk25_headless
    clang-tools
    shellcheck
    jdt-language-server
    ansible
    glslang
    pandoc
    html-tidy
    stylelint
  ];
  programs.direnv.enable = true;
}
