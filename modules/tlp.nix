{...}:
{
	services.power-profiles-daemon.enable = false;
	services.tlp = {
		enable = true;
		settings = {
			USB_AUTOSUSPEND = 0;
			SOUND_POWER_SAVE_ON_AC = 0;
			SOUND_POWER_SAVE_ON_BAT = 0;
			CPU_BOOST_ON_AC = 1;
			CPU_BOOST_ON_BAT = 0;
			CPU_MAX_PERF_ON_AC = 80;
			CPU_MAX_PERF_ON_BAT = 65;
		};
	};
}
