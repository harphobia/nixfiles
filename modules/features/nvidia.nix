{self, inputs, ...}:
{
    self.nixosModules.nvidia = { pkgs, ... } : {
        hardware.graphics.enable = true;
        services.xserver.videoDrivers = [ "modesetting" "nvidia"];

        environment.systemPackages = [ pkgs.unstable.cudaPackages.cudatoolkit ];
        boot.kernelParams = ["nvidia_drm.modeset=1"];

        hardware.nvidia = {
            modesetting.enable = true;
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
}