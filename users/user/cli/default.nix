{pkgs, lib, config, ...}:
{
    imports = [
        ./git.nix
	./utils.nix
	./tmux.nix
    ./programming.nix
	./nixvim
    ];
}
