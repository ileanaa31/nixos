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

  environment.systemPackages = [
    # Notification Daemon
    pkgs.dunst
    pkgs.libnotify

    # Network Manager GUI
    pkgs.networkmanagerapplet

    # Clipboard
    pkgs.wl-clipboard

    # Screenshot
    pkgs.slurp
    pkgs.grim

    # GNOME
    pkgs.adwaita-icon-theme

    ## File Explorer
    pkgs.nautilus

    # Image Editor
    pkgs.gimp
        
    # Terminal
    pkgs.alacritty

    # Browser
    pkgs.firefox
    
    # Pretty Proto
    pkgs.texliveFull
    pkgs.pandoc
    pkgs.jq

    # Music
    pkgs.spotify
    pkgs.playerctl

    # Chat
    pkgs.discord
    pkgs.xwaylandvideobridge # to make screen shares be less of a pain in the ass
    
    # LibreOffice
    pkgs.libreoffice

    # Code
    pkgs.vscode
    
    # Note Taking
    pkgs.obsidian

    # Nextcloud
    pkgs.nextcloud-client

    # VPN
    pkgs.eduvpn-client

    # Thunderbird Mail Client
    # pkgs.thunderbird

    # PDF
    pkgs.zathura
  ];
}
