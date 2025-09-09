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
		arrpc
		home-manager
    	git
    ];
    
	programs.adb.enable = true;
	
	programs.obs-studio.enableVirtualCamera = true;
	boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];

	programs.chromium = {
		enable = true;
		extensions = [
			"cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
			"ghmbeldphafepmbegfdlkpapadhbakde" # proton pass
			"jinjaccalgkegednnccohejagnlnfdag" # violentmonkey
		];
		extraOpts = [
			"BrowserSignin" = 0;
  			"SyncDisabled" = true;
			"PasswordManagerEnabled" = false;
		];
	};
}
