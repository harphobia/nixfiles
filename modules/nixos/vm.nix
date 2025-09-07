{lib, config, pkgs, ... }:
{
    config = lib.mkIf config.modules.vm.enable {
        programs.virt-manager.enable = true;
        virtualisation.libvirtd = {
        	enable = true;
        	qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
        };
        virtualisation.spiceUSBRedirection.enable = true;
        environment.systemPackages = with pkgs; [
  		virt-viewer
		spice-gtk
        ];
    };
}
