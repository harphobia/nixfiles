{lib, config, pkgs, ...}:
{
	imports = [ 
		../default.nix
	];
	
	home.username = "user";
	home.homeDirectory = "/home/user";
	home.stateVersion = "25.05";
	
	programs.firefox.enable = true;
}
