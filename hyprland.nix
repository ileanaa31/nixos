{ config, pkgs, ... }:

{
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	programs.hyprlock.enable = true;
	security.pam.services.hyprlock = {};

	# Greet
	services.greetd = {
	  enable = true;

	  settings.default_session = {
	    vt = 3;
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

	# stylix
	stylix.enable = true;

	environment.systemPackages = [
		# Elkowar's Wacky Widgets
		pkgs.eww

		# Zathura
		pkgs.zathura

		# Notification Daemon
		pkgs.dunst
		pkgs.libnotify

		# Network Manager GUI
		pkgs.networkmanagerapplet

		# Wallpaper Engine
		pkgs.swww

		# Clipboard
		pkgs.wl-clipboard

		# Screenshot
		pkgs.slurp
		pkgs.grim

		# File Explorer
		pkgs.gnome.nautilus

		# Image Editor
		pkgs.gimp

		# Terminal
		pkgs.alacritty

		# Password Manager
		pkgs.keepassxc

		# Browser
		pkgs.firefox

		# Pretty Proto
		pkgs.texliveFull
		pkgs.pandoc
		pkgs.jq

		# LanguageTool
		pkgs.languagetool

		# Ausweis App
		pkgs.ausweisapp
		
		# Music
		pkgs.spotify
		pkgs.playerctl

		# Photography
		pkgs.rawtherapee

		# Videography
		pkgs.shotcut

		# Chat
		pkgs.discord
		pkgs.webcord
		pkgs.xwaylandvideobridge # to make screen shares be less of a pain in the ass
		pkgs.element-desktop

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

		# Processing -- for the arts babeyyyyyy
    		pkgs.processing
	];

	fonts.packages = with pkgs; [
		ubuntu_font_family
		(nerdfonts.override { fonts = [ "FiraCode" ]; })
	];
}
