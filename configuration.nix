{ config, pkgs, ... }:

{
  imports =
    [
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
  services.avahi = { # auto-discovery
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Scanner
  hardware.sane = {
    enable = true;
  };

  # USB Stuff
  boot.supportedFilesystems = [ "ntfs" "fat32" "exfat" ];
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Networking
  networking.hostName = "robert"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # annoying stuff with nix
  programs.nix-ld.enable = true;

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anton = {
    isNormalUser = true;
    description = "Anton";
    extraGroups = [ "networkmanager" "wheel" "docker" "scanner" "lp" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
   vim
   wget
   unzip
   git
   neofetch
   home-manager
   hplip # HP Driver Stuff
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
