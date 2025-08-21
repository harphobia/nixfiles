{lib, config, pkgs, ...}:
{
	imports = [ 
		../modules/home-manager
	];
	
	home.username = "user";
	home.homeDirectory = "/home/user";
	
	programs.firefox.enable = true;
	
	home.stateVersion = "25.05";
}
