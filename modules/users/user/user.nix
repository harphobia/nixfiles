{ self, inputs, ... }: {
      flake.nixosModules.user = { pkgs, lib, ... }: {
            users.users.user = {
                enable = true;
                isNormalUser = true;
                extraGroups = [ "networkmanager" "wheel" "gamemode" "libvirtd" "kvm" "qemu" "podman" ];
                shell = pkgs.bash;
            };

      };

    flake.homeConfigurations.user = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs-stable.legacyPackages."x86_64-linux";
            modules = [ self.homeModules.user ];
    };
}