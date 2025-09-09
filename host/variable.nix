{config, lib, ...}:
{
	options = {
        	modules.kde.enable =  lib.mkEnableOption "kde plasma";
        	modules.gnome.enable =  lib.mkEnableOption "gnome";
        	modules.hyprland.enable =  lib.mkEnableOption "hyprland";
        	
        	modules.docker.enable = lib.mkEnableOption "docker";
			modules.docker.rootless.enable = lib.mkEnableOption "docker rootless";
			modules.nbfc.enable = lib.mkEnableOption "nbfc-linux";
			modules.nbfc.model = lib.mkOption { type = lib.types.str; };
			modules.nvidia.enable =  lib.mkEnableOption "nvidia";
			modules.steam.enable = lib.mkEnableOption "steam";
			modules.tlp.enable =  lib.mkEnableOption "tlp";
			modules.vm.enable =  lib.mkEnableOption "virtual machine";
			modules.zsh.enable =  lib.mkEnableOption "zsh";
    	};
    	
    	config = {
			modules.kde.enable = lib.mkDefault false;
			modules.gnome.enable = lib.mkDefault false;
			modules.hyprland.enable = lib.mkDefault false;

			modules.nvidia.enable = lib.mkDefault true;
			modules.tlp.enable = lib.mkDefault true;
			modules.nbfc.enable = lib.mkDefault true;
			modules.nbfc.model = lib.mkDefault "Acer Nitro AN515-57";
			modules.docker.enable = lib.mkDefault true; 
			modules.docker.rootless.enable = lib.mkDefault true;
			modules.zsh.enable = lib.mkDefault true;
			modules.steam.enable = lib.mkDefault true;
			modules.vm.enable = lib.mkDefault true;    	
    	};
}
