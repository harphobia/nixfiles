{pkgs, config, lib, ...}:
{
	options = {
		modules.adb.enable = lib.mkEnableOption "adb";
	};

	config = lib.mkIf config.modules.adb.enable {
		programs.adb.enable = true;
		services.udev.packages = [ pkgs.android-udev-rules ];
	};
}
