{pkgs, config, lib, ...}:
{
	config = lib.mkIf config.modules.steam.enable {
		programs.steam = {
			enable = true;
			gamescopeSession.enable = true;
			remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
			dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
		};
		
		programs.gamescope = {
			enable = true;
			capSysNice = true;
		};
		
		environment.systemPackages = with pkgs; [ mangohud ];
	};
}
