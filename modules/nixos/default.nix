{ lib, config, pkgs, ... }:
{
    imports = [
        ./nvidia.nix
        ./tlp.nix
        ./nbfc-linux.nix
    	./docker.nix
        ./utils.nix
        ./zsh.nix
        ./kde-plasma.nix
        ./gnome.nix
        ./hyprland.nix
        ./steam.nix
        ./vm.nix
    ];
    
    modules.kde.enable = lib.mkDefault false;
    modules.gnome.enable = lib.mkDefault true;
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
}
