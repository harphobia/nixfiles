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

    modules.hardware.nvidia.enable = lib.mkDefault true;
    modules.utils.tlp.enable = lib.mkDefault true;
    modules.utils.nbfc.enable = lib.mkDefault true;
    modules.utils.nbfc.model = lib.mkDefault "Acer Nitro AN515-57";
    modules.utils.docker.enable = lib.mkDefault true; 
    modules.utils.docker.rootless.enable = lib.mkDefault true;
    modules.utils.adb.enable = lib.mkDefault true;
    modules.desktop.kde.enable = lib.mkDefault false;
    modules.desktop.gnome.enable = lib.mkDefault false;
    modules.desktop.hyprland.enable = lib.mkDefault true;
}
