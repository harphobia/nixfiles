{ lib, config, pkgs, ... }:
{
    imports = [
        ./nvidia.nix
        ./tlp.nix
        ./nbfc-linux.nix
    	./docker.nix
	    ./adb.nix
        ./utils.nix
        ./zsh.nix
        ./kde-plasma.nix
        ./gnome.nix
        ./hyprland.nix
    ];

    modules.nvidia.enable = lib.mkDefault true;
    modules.tlp.enable = lib.mkDefault true;
    modules.nbfc.enable = lib.mkDefault true;
    modules.nbfc.model = lib.mkDefault "Acer Nitro AN515-57";
    modules.docker.enable = lib.mkDefault true; 
    modules.docker.rootless.enable = lib.mkDefault true;
    modules.adb.enable = lib.mkDefault true;
    modules.kde.enable = lib.mkDefault false;
    modules.gnome.enable = lib.mkDefault false;
    modules.hyprland.enable = lib.mkDefault true;
}
