{ self, inputs, ... }: {
      flake.nixosModules.utils = { pkgs, lib, config, ... }: {
        	environment.systemPackages = with pkgs; [
                unrar unzip
                p7zip
                jq ripgrep
                fd fzf tree
                pciutils usbutils ntfs3g
                ffmpeg vim
                home-manager git
                scx.full android-tools 
                lsfg-vk lsfg-vk-ui
                wget aria2
                helium libreoffice-still mpv
            ];

            services.udisks2.enable = true;
            services.flatpak.enable = true;
            
            # for obs
            programs.obs-studio.enableVirtualCamera = true;
            boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback.out ];

            programs.java = {
                enable = true;
                package = pkgs.temurin-bin;
            };
      };
}