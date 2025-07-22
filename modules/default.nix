{ lib, config, pkgs, ... }:
{
    imports = [
        ./hardware/nvidia.nix

        ./utils/tlp.nix
        ./utils/nbfc-linux.nix
	./utils/docker.nix
	./utils/adb.nix

        ./shell/zsh.nix

        ./desktop/kde-plasma.nix
        ./desktop/gnome.nix
        ./desktop/hyprland.nix
    ];
}
