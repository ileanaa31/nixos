{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

  };

  programs.hyprlock.enable = true;
  security.pam.services.hyprlock = { };

  # Greet
  services.greetd = {
    enable = true;

    vt = 2;
    settings.default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks --cmd Hyprland";
    };
  };

  # Keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Java
  programs.java = {
    enable = true;
    package = pkgs.jdk8;
  };

  services.udev.packages = [
    #Arduino IDE
    pkgs.arduino

    #PlatformIO
    pkgs.platformio-core
    pkgs.openocd
  ];

  environment.systemPackages = [

    # 3D-Printing
    pkgs.prusa-slicer

    # Arduino
    pkgs.arduino-ide
    pkgs.platformio

    # Audio Control
    pkgs.pwvucontrol

    # Backlight Control
    pkgs.brightnessctl

    # Browser
    pkgs.firefox

    # Chat
    pkgs.discord
    pkgs.kdePackages.xwaylandvideobridge # to make screen shares be less of a pain in the ass
    pkgs.signal-desktop
    pkgs.element-desktop

    # Clipboard
    pkgs.wl-clipboard

    # Code
    pkgs.vscode
    pkgs.arduino-ide
    pkgs.pgadmin4-desktopmode
    pkgs.postgresql
    pkgs.drawio

    # Driver
    pkgs.amdvlk
    pkgs.linuxKernel.packages.linux_zen.xpadneo

    # File Explorer
    pkgs.nautilus

    # scrcpy for android screen share
    pkgs.scrcpy

    # GNOME
    pkgs.adwaita-icon-theme
    pkgs.gnome-disk-utility

    # Image Editor
    pkgs.gimp
    pkgs.gthumb

    # LibreOffice
    pkgs.libreoffice

    # Math
    pkgs.geogebra

    # Music
    pkgs.spotify
    pkgs.playerctl

    # Network Manager GUI
    pkgs.networkmanagerapplet

    # Nextcloud
    pkgs.nextcloud-client

    # Note Taking
    pkgs.obsidian
    pkgs.notepadqq
    pkgs.anki
    pkgs.rnote

    # Notification Daemon
    pkgs.dunst
    pkgs.libnotify

    # PDF
    pkgs.zathura

    # Pretty Proto
    pkgs.texliveFull
    pkgs.pandoc
    pkgs.jq

    # Screen
    pkgs.hyprsunset

    # Screenshot
    pkgs.slurp
    pkgs.grim

    # Terminal
    pkgs.alacritty

    # Thunderbird Mail Client
    pkgs.thunderbird

    # Video Player
    pkgs.mpv

    # VPN
    pkgs.eduvpn-client
  ];
}
