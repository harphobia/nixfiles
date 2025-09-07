{lib, config, pkgs, ... }:
{
    config = lib.mkIf config.modules.hyprland.enable {
		programs.hyprland.enable = true; 
		programs.hyprland.withUWSM = true;
		programs.hyprlock.enable = true;
		
		services.udisks2.enable = true;
		
		environment.systemPackages = with pkgs; [
			hyprpicker
			hyprcursor
			hyprpaper
			hyprshot    		
			
			alacritty
			wofi
			wl-clipboard
		];
    };
}
