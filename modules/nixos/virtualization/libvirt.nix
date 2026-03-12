{ pkgs, lib, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      verbatimConfig = ''
        firmware_metadata_dirs = ["${pkgs.qemu_kvm}/share/qemu/firmware"]
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  services.spice-vdagentd.enable = true;
}
