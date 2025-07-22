{lib, config, pkgs, ...}:
{
	imports = [
		./cli
		./gui
		./configs/stylix.nix
	];

	home.username = "user";
	home.homeDirectory = "/home/user";

	home.packages = with pkgs; [
		unrar
		unzip
		p7zip
		jq
		ripgrep
		fzf
		tree
		pciutils
		usbutils
		aria2
	];


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
