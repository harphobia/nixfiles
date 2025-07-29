{lib, config, pkgs, ... }:
{
    options = {
        modules.hyprland.enable =  lib.mkEnableOption "hyprland";
    };


    config = lib.mkIf config.modules.hyprland.enable {
		programs.hyprland.enable = true; 
		programs.hyprland.withUWSM = true;
		programs.hyprlock.enable = true;
		services.hypridle.enable = true;
		
		environment.systemPackages = with pkgs; [
			hyprpicker
			hyprcursor
			hyprlock
			hypridle
			hyprpaper
			hyprshot    		
			
			alacritty
			wofi
			wl-clipboard
		];

		xdg.portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-gtk
                xdg-desktop-portal-hyprland
            ];
        };
    };
}
