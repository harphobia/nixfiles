{lib, config, pkgs, ... }:
{
    options = {
        modules.vm.enable =  lib.mkEnableOption "virtual machine";
    };


    config = lib.mkIf config.modules.vm.enable {
        programs.virt-manager.enable = true;
        virtualisation.libvirtd = {
        	enable = true;
        	qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
        };
        virtualisation.spiceUSBRedirection.enable = true;
        environment.systemPackages = with pkgs; [
  		virt-viewer
        ];
    };
}
