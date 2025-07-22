{pkgs, lib, config, ...}:
{
	home.packages = with pkgs;[
		unrar
		unzip
		p7zip
		jq
		ripgrep
		fzf
		tree
		pciutils
		usbutils
		aria2
		ncspot
		lf
		lazysql
		lazydocker
	];
}
