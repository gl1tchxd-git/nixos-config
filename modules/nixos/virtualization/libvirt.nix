{ pkgs, lib, ... }: {
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
      virt-manager
  ];

  system.activationScripts.libvirtFirmwareLinks = {
    text = ''
      mkdir -p /var/lib/libvirt/firmware
      ln -sf ${pkgs.qemu_kvm}/share/qemu/edk2-x86_64-secure-code.fd \
        /var/lib/libvirt/firmware/edk2-x86_64-secure-code.fd
      ln -sf ${pkgs.qemu_kvm}/share/qemu/edk2-i386-vars.fd \
        /var/lib/libvirt/firmware/edk2-i386-vars.fd
    '';
    deps = [];
  };
}