{inputs, pkgs, lib, config, ...}:
{
	imports = [
		./plugins
	];
	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		clipboard.providers.wl-copy.enable = true;
		globals.mapleader = " ";
		opts = {
			number = true;
			relativenumber = true;
			signcolumn = "yes";

			shiftwidth = 4;
			tabstop = 4;
			softtabstop = 4;
			expandtab = true;
		};
		extraConfigLuaPost = ''vim.cmd [[ colorscheme default ]]'';
	};
}
