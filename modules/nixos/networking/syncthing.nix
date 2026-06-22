{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.syncthing = {
    enable = true;
    user = "felix";
    dataDir = "/home/felix";
    configDir = "/home/felix/.config/syncthing";
    openDefaultPorts = true;
    overrideDevices = true;
    overrideFolders = true;

    settings = {
      devices = {
        "desktop-felix" = {
          id = "4LB7MDM-CWKFSWC-HJU3DAM-NOGT2IJ-6EEHMBI-HWJJPZ4-7QGKILR-ZGHCRAL";
          addresses = [ "tcp://desktop-felix" ];
        };
      };

      folders = {
        "desktop-felix-shared" = {
          id = "qcjsj-s7c3j";
          path = "/home/felix/desktop-felix-shared";
          devices = [ "desktop-felix" ];
          versioning = {
            type = "staggered";
            params.cleanInterval = "3600";
            params.maxAge = "2592000";
          };
        };
      };
    };
  };
}
