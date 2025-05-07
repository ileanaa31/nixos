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
  programs.java = { enable = true; package = pkgs.jre8; };

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

    # Backlight Control
    pkgs.brightnessctl

    # Browser
    pkgs.firefox

    # Chat
    pkgs.discord
    pkgs.xwaylandvideobridge # to make screen shares be less of a pain in the ass
    pkgs.signal-desktop

    # Clipboard
    pkgs.wl-clipboard

    # Code
    pkgs.vscode
    pkgs.arduino-ide
    pkgs.pgadmin4-desktopmode
    pkgs.postgresql
    pkgs.drawio

    # File Explorer
    pkgs.nautilus

    # GNOME
    pkgs.adwaita-icon-theme

    # Image Editor
    pkgs.gimp

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

    # Notification Daemon
    pkgs.dunst
    pkgs.libnotify

    # PDF
    pkgs.zathura
    pkgs.xournalpp
    
    # Pretty Proto
    pkgs.texliveFull
    pkgs.pandoc
    pkgs.jq

    # Screenshot
    pkgs.slurp
    pkgs.grim

    # Terminal
    pkgs.alacritty

    # Thunderbird Mail Client
    pkgs.thunderbird

    # VPN
    pkgs.eduvpn-client
  ];
}
