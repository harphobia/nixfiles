{ pkgs, lib, config, ... }:
{
	imports = [
        	./dev.nix
        	./git.nix
        	./libreoffice.nix
        	./obs.nix
        	./tmux.nix
        	./utils.nix
	];
}
