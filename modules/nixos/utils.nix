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
    ];
    
	programs.adb.enable = true;
	services.udev.packages = [ pkgs.android-udev-rules ];
	
	programs.obs-studio.enableVirtualCamera = true;
	boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
}
