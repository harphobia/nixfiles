{ self, inputs, ... }: {
    flake.nixosModules.user = { pkgs, ... }: {
        users.users.user = {
            enable = true;
            isNormalUser = true;
            extraGroups = [ "networkmanager" "wheel" "gamemode" "libvirtd" "kvm" "qemu" "podman" ];
            shell = pkgs.foot;
	    };
    };
}