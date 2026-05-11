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
    unstable.zed-editor
    unstable.godot # until stable channel has 4.6.2
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
