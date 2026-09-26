{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    obs-cmd
    kdePackages.kdenlive
    # davinci-resolve
    reaper
    chatterino7
  ];

  security.pam.loginLimits = [
    {
      domain = "@audio";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
    {
      domain = "@audio";
      item = "rtprio";
      type = "-";
      value = "99";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "soft";
      value = "99999";
    }
    {
      domain = "@audio";
      item = "nofile";
      type = "hard";
      value = "524288";
    }
  ];
  services.pipewire.jack.enable = true;
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" ];
  programs.obs-studio = {
    enable = true;
    package = pkgs.unstable.obs-studio;
    plugins = with pkgs.unstable.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
      obs-multi-rtmp
      advanced-scene-switcher
      # obs-replay-source
      obs-websocket # for obs-cmd
      obs-retro-effects
      input-overlay
      obs-aitum-multistream
      # obs-dvd-screensaver
      obs-vertical-canvas
    ];
  };
}
