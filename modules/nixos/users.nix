{ pkgs, lib, ... }: {
  users.users.felix = {
    isNormalUser = true;
    description = "Felix Buchsteiner";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "dialout" "docker" ];
  };
}