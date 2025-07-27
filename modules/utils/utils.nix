{ config, pkgs, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        unrar
		unzip
		p7zip
		jq
		ripgrep
		fd
		fzf
		tree
		pciutils
		usbutils
		ffmpeg
        arion
    ];
}
