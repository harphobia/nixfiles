{lib, config, pkgs, ... }:
{
	options = {
		modules.docker.enable = lib.mkEnableOption "docker";
		modules.docker.rootless.enable = lib.mkEnableOption "docker rootless";
	};

	config = lib.mkIf config.modules.docker.enable {
		environment.systemPackages = with pkgs; [ docker-compose ];
		virtualisation.docker = {
			enable = !config.modules.docker.rootless.enable;
			rootless = {
				enable = config.modules.docker.rootless.enable;
				setSocketVariable = true;
				daemon.settings = {
					dns = [ "1.1.1.1" "8.8.8.8" ];
					registry-mirrors = [ "https://mirror.gcr.io" ];
				};
			};
		};
	};
}
