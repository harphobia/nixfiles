{ self, inputs, ... }: {
    flake.nixosModules.steam = { pkgs, ... }: {
        programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            gamescopeSession.enable = true;
        };

        hardware.xone.enable = true;
        programs.gamescope = { 
            enable = true;
            capSysNice = false;
            env = {
                PROTON_ENABLE_WAYLAND="1";
                PROTON_DLSS_UPGRADE="1";
                PROTON_FSR4_UPGRADE="1";
            };
            args = [
                "--output-width 1920"
                "--output-height 1080"
                "--nested-refresh 144"
                "--fullscreen "
                "--force-grab-cursor"
                "--immediate-flips"
            ];
        };

        programs.gamemode = {
            enable = true;
            enableRenice = true;
            settings = {
                general = {
                    renice = 10;
                    inhibit_screensaver = 1;
                };
                custom = {
                    start = "${pkgs.scx-loader}/bin/scxctl switch --sched lavd";
                    end = "${pkgs.scx-loader}/bin/scxctl switch --sched bpfland";
                };
            };
        };
        environment.variables = {
            GAMEMODERUNEXEC = "env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only";
        };

        environment.systemPackages = with pkgs; [
            gamescope-wsi
            scx-loader
            scx.full
        ];
    };
}
