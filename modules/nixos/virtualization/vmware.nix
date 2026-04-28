{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    vmware-workstation
    open-vm-tools
  ];
  virtualisation.vmware.host.enable = true;
  users.users.felix.extraGroups = [ "kvm" ];
}
