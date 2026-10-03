{ self, inputs, ... }: {
	flake.nixosModules.utils = { pkgs, lib, config, ... }: {
		systemd.services."getty@tty1" = {
			overrideStrategy = "asDropin";
			serviceConfig.ExecStart = ["" "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${config.services.getty.loginProgram} --autologin user --noclear --keep-baud %I 115200,38400,9600 $TERM"];
		};
		
		environment.systemPackages = with pkgs; [
			unrar unzip
				p7zip
				jq ripgrep
				fd fzf tree
				pciutils usbutils ntfs3g
				ffmpeg vim
				home-manager git brightnessctl
				android-tools 
				lsfg-vk lsfg-vk-ui
				wget aria2
				helium libreoffice mpv
				syswatch nvtopPackages.full
		];

		services.udisks2.enable = true;
		services.flatpak.enable = true;

        programs.gpu-screen-recorder = {
            enable = true;
            ui.enable = true; # For overlay
        };

		programs.java = {
			enable = true;
			package = pkgs.temurin-bin;
		};

		xdg.portal = {
			enable = true;
			extraPortals = [
				pkgs.xdg-desktop-portal-gnome
					pkgs.xdg-desktop-portal-gtk
			];
			config = {
				common = {
					default = [ "gnome" ];
				};
				niri = {
					default = [ "gnome" ];
					"org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
					"org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
				};
			};
		};

		boot.loader.systemd-boot.windows."windows" = {
			title = "Michaelsoft Binbows";
			efiDeviceHandle = "FS1";
		};
	};
}
