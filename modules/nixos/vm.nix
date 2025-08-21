{lib, config, pkgs, ... }:
{
    options = {
        modules.vm.enable =  lib.mkEnableOption "virtual machine";
    };


    config = lib.mkIf config.modules.vm.enable {
        programs.virt-manager.enable = true;
        virtualisation.libvirtd.enable = true;
        virtualisation.spiceUSBRedirection.enable = true;
    };
}
