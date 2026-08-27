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
    godot
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
    tea
    ldtk
  ];
  programs.direnv.enable = true;
}
