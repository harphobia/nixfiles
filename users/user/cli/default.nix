{pkgs, lib, config, ...}:
{
    imports = [
        ./git.nix
	./utils.nix
	./tmux.nix
	./nixvim
    ];
}
