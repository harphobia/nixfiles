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
}
