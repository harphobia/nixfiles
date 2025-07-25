{lib, config, pkgs, ... }:
{
    options = {
        modules.desktop.gnome.enable =  lib.mkEnableOption "gnome";
    };


    config = lib.mkIf config.modules.desktop.gnome.enable {
        services.xserver.enable = true;

	# Enable the GNOME Desktop Environment.
	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	
	# Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  	systemd.services."getty@tty1".enable = false;
  	systemd.services."autovt@tty1".enable = false;
    };
}
