{pkgs, ...}:
{
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
		
		hardware.xone.enable = true; # support for the xbox controller USB dongle
		environment.systemPackages = with pkgs; [ mangohud ];
}
