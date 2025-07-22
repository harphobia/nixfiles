{lib, config, pkgs, ... }:
{
	options = {
		modules.utils.docker.enable = lib.mkEnableOption "docker";
		modules.utils.docker.rootless.enable = lib.mkEnableOption "docker rootless";
	};

	config = lib.mkIf config.modules.utils.docker.enable {
		virtualisation.docker = {
			enable = !config.modules.utils.docker.rootless.enable;
			rootless = {
				enable = config.modules.utils.docker.rootless.enable;
				setSocketVariable = true;
				daemon.settings = {
					dns = [ "1.1.1.1" "8.8.8.8" ];
					registry-mirrors = [ "https://mirror.gcr.io" ];
				};
			};
		};
	};
}
