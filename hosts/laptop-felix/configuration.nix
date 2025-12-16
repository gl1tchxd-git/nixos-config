# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, inputs, ... }:

let
  modules = map (m: ../../modules/nixos + m) [
    /boot/grub.nix
    /boot/plymouth.nix
    /desktop/gnome.nix
    /development/embedded.nix
    /development/sysadmin.nix
    /development/jetbrains.nix
    /development/langs.nix
    /gaming/steam.nix
    /hardware/audio.nix
    /hardware/fingerprint.nix
    /hardware/graphics.nix
    /hardware/sayo.nix
    /hardware/tablet.nix
    /hardware/touchpad.nix
    /localization
    /networking
    /networking/tailscale.nix
    /services/onedrive.nix
    /services/printing.nix
    /virtualization/docker.nix
    /virtualization/libvirt.nix
    /virtualization/wine.nix
    /users.nix
    /aliases.nix
  ];
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ] ++ modules;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "laptop-felix";
  system.stateVersion = "25.05"; # Did you read the comment?
}