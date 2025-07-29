{lib, config, pkgs, ... }:
{
    options = {
        modules.nvidia.enable =  lib.mkEnableOption "nvidia";
    };


    config = lib.mkIf config.modules.nvidia.enable {
        hardware.graphics.enable = true;
        services.xserver.videoDrivers = [ "modesetting" "nvidia"];
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
    };
}
