{pkgs, config, ... }:
{
	hardware.graphics.enable = true;
	services.xserver.videoDrivers = [ "modesetting" "nvidia"];

	environment.systemPackages = with pkgs; [ cudaPackages.cudatoolkit ];

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = true;
		nvidiaSettings = false;
		package = config.boot.kernelPackages.nvidiaPackages.latest;

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
