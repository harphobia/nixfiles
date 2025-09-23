{pkgs, config, ... }:
{
	hardware.graphics.enable = true;
	services.xserver.videoDrivers = [ "modesetting" "nvidia"];

	environment.variables = {
		__GL_SHADER_DISK_CACHE_SKIP_CLEANUP = 1;
	};

	environment.systemPackages = with pkgs; [ cudaPackages.cudatoolkit ];

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = false;
		nvidiaSettings = false;
		package = config.boot.kernelPackages.nvidiaPackages.stable;

		prime = {
			offload = {
				enable = true;
				enableOffloadCmd = true;
			};
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
	};
}
