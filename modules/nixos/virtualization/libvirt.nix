{ pkgs, lib, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      vhostUserPackages = with pkgs; [ virtiofsd ];
      runAsRoot = true;
      swtpm.enable = true;
      verbatimConfig = ''
        firmware_metadata_dirs = ["${pkgs.qemu_kvm}/share/qemu/firmware"]
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    virtiofsd
  ];

  services.spice-vdagentd.enable = true;
}
