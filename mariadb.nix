{ config, lib, pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;

    # Creates a DB user matching your Linux user, authenticated via unix socket
    ensureUsers = [
      {
        name = "youruser"; # <- change to your username
        ensurePermissions = {
          "*.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };

  environment.systemPackages = [ pkgs.mysql-workbench ];

}
