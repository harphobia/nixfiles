{pkgs, config, lib, ...}:
{
	options = {
		modules.utils.adb.enable = lib.mkEnableOption "adb";
	};

	config = lib.mkIf config.modules.utils.adb.enable {
		programs.adb.enable = true;
		services.udev.packages = [ pkgs.android-udev-rules ];
	};
}
