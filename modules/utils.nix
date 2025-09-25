{pkgs, config, ...}:
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
		arrpc
		home-manager
		git
		scx.full
	];

	programs.adb.enable = true;

	programs.obs-studio.enableVirtualCamera = true;
	boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];
}
