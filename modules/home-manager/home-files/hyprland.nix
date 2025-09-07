{lib, config, pkgs, ...}:
{
	imports = [ 
		../default.nix
		../nixvim
	];
	
	home.username = "user";
	home.homeDirectory = "/home/user";
	home.stateVersion = "25.05";
	
	home.packages = with pkgs; [
		btop
		ncspot
		lf
		pulsemixer
		impala
		nchat
		bluetui
	];
	
	xdg.configFile = {
		hypr = {
			source = ../hyprland-configs/hyprland;
			recursive = true;
		};
		
		uwsm = {
			source = ../hyprland-configs/uwsm;
			recursive = true;
		};
		
		"ncspot/config.toml".source = ../hyprland-configs/ncspot/ncspot.toml;
	};
	
	home.file.".zprofile".source = ../hyprland-configs/.zprofile;
	
	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.simp1e-cursors;
		name = "Simp1e-Catppuccin-Latte";
		size = 16;
	};
	
	qt = {
		enable = true;
		style.name = "adwaita-dark";
	};
	
	gtk = {
    		enable = true;
		theme = {
			package = pkgs.gnome-themes-extra;
			name = "Adwaita-Dark";
		};
		
		iconTheme = {
			package = pkgs.adwaita-icon-theme;
			name = "Adwaita-Dark";
		};
    	};
}
