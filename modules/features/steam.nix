{self, inputs, ...}:
{
    self.nixosModules.steam = { ... } : {
        programs.steam = {
			enable = true;
			remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
			dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
			gamescopeSession.enable = true;
		};

		hardware.xone.enable = true; #support for the xbox controller USB dongle
		programs.gamescope = { 
			enable = true;
			capSysNice = false;
			env = {
				SDL_VIDEODRIVER="x11";
				PROTON_DLSS_UPGRADE="1";
				PROTON_FSR4_UPGRADE="1";
			};
			args = [
				"--output-width 1920"
				"--output-height 1080"
				"--nested-refresh 144"
				"--fullscreen "
				"--force-grab-cursor"
				"--backend sdl"
				"--immediate-flips"
			];
		};

		programs.gamemode.enable = true;
		environment.variables = {
			GAMEMODERUNEXEC = "env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only";
            __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
		};

		environment.systemPackages = with pkgs; [
			gamescope-wsi
		];
    }
}