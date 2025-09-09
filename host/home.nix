{lib, config, pkgs, ...}:
{
	imports = [ 
		../modules/home-manager
	];
	
	home.username = "user";
	home.homeDirectory = "/home/user";
	home.stateVersion = "25.05";
}
