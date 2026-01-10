{...}:
{
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	services.pipewire.extraConfig.pipewire."11-clock" = {
		"context.properties" = {
			"default.clock.rate" = 48000;
			"default.clock.quantum" = 4096;
			"default.clock.min-quantum" = 512;
			"default.clock.max-quantum" = 16384;
		};
	};
}
