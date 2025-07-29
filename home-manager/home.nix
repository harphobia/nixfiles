{lib, config, pkgs, ...}:
{
	imports = [ 
		./apps
	];
	
	home.username = "user";
	home.homeDirectory = "/home/user";

	xdg.configFile."hypr" = {
		source = ./configs/hyprland;
		recursive = true;
	};
	
	xdg.configFile."alacritty" = {
		source = ./configs/alacritty;
		recursive = true;
	};

	home.file.".zprofile".source = ./configs/.zprofile;

	home.stateVersion = "25.05";
}
