{ self, inputs, ... }: {
    flake.nixosModules.user = { pkgs, ... }: {
        users.users.user = {
            enable = true;
            isNormalUser = true;
            extraGroups = [ "networkmanager" "wheel" "gamemode" "libvirtd" "kvm" "qemu" "podman" ];
            shell = pkgs.fish;
	    };

        xdg.configFile."alacritty/alacritty.toml".source = ./config/alacritty.toml
        xdg.configFile."i3/config".source = ./config/i3.config
        xdg.configFile."i3status/config".source = ./config/i3status.config
    };
}