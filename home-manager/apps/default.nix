{ pkgs, lib, config, ... }:
{
	imports = [
		./nixvim
        ./dev.nix
        ./git.nix
        ./libreoffice.nix
        ./obs.nix
        ./tmux.nix
        ./utils.nix
	];
}
