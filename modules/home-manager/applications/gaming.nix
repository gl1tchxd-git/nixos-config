{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Gaming
    lunar-client
    osu-lazer-bin
    # steamtinkerlaunch
    furmark
    rpcs3
    prismlauncher
    unstable.satisfactorymodmanager
  ];

  systemd.user.services.arrpc = {
    Unit = {
      Description = "arRPC Rich Presence Service";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.arrpc}/bin/arrpc";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
