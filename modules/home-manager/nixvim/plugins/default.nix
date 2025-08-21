{pkgs, lib, config, ...}:
{
	imports = [
		./telescope.nix
		./cmp.nix
		./lsp.nix
	];
}
