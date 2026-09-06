{ self, inputs, ... }: {
	flake.homeModules.udiskie = { lib, pkgs, ... }: {
		services.udiskie = {
            enable = true;
            tray = "never";
			settings = {
				# https://github.com/nix-community/home-manager/issues/632
				program_options = {
					file_manager = lib.getExe pkgs.nautilus;
				};
			};
		};
	};
}