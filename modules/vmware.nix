{ config, lib, pkgs, ... }:

{
  virtualisation.vmware.host.enable = true;
  boot.kernelParams = [ "transparent_hugepage=never" ];
}
