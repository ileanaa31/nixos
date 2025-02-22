{ pkgs, ... }:

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

	environment.systemPackages = [
		# Minecraft :3
		pkgs.prismlauncher

		# Zathura
		pkgs.zathura

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

		# File Explorer
		pkgs.nautilus

		# Image Editor
		pkgs.gimp
		pkgs.imagemagick
		pkgs.pdf2svg

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

		# BibTex
		pkgs.jabref
		
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
		pkgs.mattermost

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
		pkgs.thunderbird
		
		# Processing -- for the arts babeyyyyyy
    		pkgs.processing
	];

	fonts.packages = with pkgs; [
		ubuntu_font_family
		liberation_ttf
		(nerdfonts.override { fonts = [ "FiraCode" ]; })
	];
}
