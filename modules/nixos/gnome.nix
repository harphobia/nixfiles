{lib, config, pkgs, ... }:
{
    options = {
        modules.gnome.enable =  lib.mkEnableOption "gnome";
    };


    config = lib.mkIf config.modules.gnome.enable {
        services.xserver.enable = true;

        # Enable the GNOME Desktop Environment.
        services.xserver.displayManager.gdm.enable = true;
        services.xserver.desktopManager.gnome.enable = true;
        
        # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
        systemd.services."getty@tty1".enable = false;
        systemd.services."autovt@tty1".enable = false;
        
        environment.systemPackages = with pkgs; [
        	gnome-tweaks
        	gnome-extension-manager
        	yaru-theme
        	easyeffects
		helvum
		pavucontrol
        ];
        
        services.gnome.gnome-keyring.enable = lib.mkForce false;
        
        ## Remove default GNOME apps - comment out apps you want to keep
	environment.gnome.excludePackages = (with pkgs; [
	    gnome-connections
	    gnome-photos
	    # gnome-text-editor
	    gnome-tour
            # gnome-calculator
	    # gnome-calendar
	    gnome-characters
	    gnome-clocks
	    gnome-contacts
	    gnome-disk-utility
	    gnome-font-viewer
	    gnome-logs
	    gnome-maps
	    gnome-music
	    # gnome-screenshot
	    # gnome-system-monitor
	    gnome-weather
	    gnome-shell-extensions
        gnome-software
	  ]) ++ (with pkgs; [
            decibels
            snapshot
	    cheese      # photo booth
	    # eog         # image viewer
	    epiphany    # web browser
	    # evince      # document viewer
	    # file-roller # archive manager
	    geary       # email client
	    seahorse    # password manager
	    # simple-scan # document scanner
	    totem       # video player
	    yelp        # help viewer
	]);
	
	services.xserver.excludePackages = [ pkgs.xterm ];
	
        xdg.portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-gtk
                xdg-desktop-portal-gnome
            ];
        };
    };
}
