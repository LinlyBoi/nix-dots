{
  config,
  lib,
  pkgs,
  ...
}:

{
  fileSystems."/mnt/Stuff" = {
    device = "/dev/disk/by-uuid/35c615aa-ecc8-4dea-a8b5-ba0a9ee3e9db";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
      "x-gvfs-show"
    ];
  };
  fileSystems."/mnt/BigStuff" = {
    device = "/dev/disk/by-uuid/d9084523-fe50-4fcd-8243-b698fcb42880";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
      "x-gvfs-show"
    ];
  };
  fileSystems."/mnt/oldHDD" = {
    device = "/dev/disk/by-uuid/8da27c7c-5372-4e88-92ca-e8a02e527956";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
      "x-gvfs-show"
    ];
  };
  fileSystems."/mnt/Goatee" = {
    device = "/dev/disk/by-uuid/CCE80A59E80A41E6";
    fsType = "ntfs";
    options = [
      "defaults"
      "nofail"
      "x-gvfs-show"
    ];
  };
}
