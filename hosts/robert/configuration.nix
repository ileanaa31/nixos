{ config, pkgs, ... }:

{
  imports = [
    ../generic/configuration.nix
    ./hardware-configuration.nix
    ./hyprland.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-efae76f9-a9ee-4ffc-a776-d4c2f487b803".device = "/dev/disk/by-uuid/efae76f9-a9ee-4ffc-a776-d4c2f487b803";

  # Graphics
  hardware.graphics.enable = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable sound with pipewire
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Printing
  services.printing.enable = true;
  services.avahi = {
    # auto-discovery
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Scanner
  hardware.sane = {
    enable = true;
  };

  # USB Stuff
  boot.supportedFilesystems = [
    "ntfs"
    "fat32"
    "exfat"
  ];
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Networking
  networking.networkmanager.enable = true;
  networking.hostName = "robert"; # Define your hostname.

  # Docker
  virtualisation.docker.enable = true;

  # annoying stuff with nix
  programs.nix-ld.enable = true;

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anton = {
    isNormalUser = true;
    description = "Anton";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "scanner"
      "lp"
    ];
  };
}
