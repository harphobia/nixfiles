{pkgs, ...}:
{
	programs.sway = {
		enable = true;
		extraPackages = with pkgs; [
			wl-clipboard
			slurp
			grim
			libnotify
			mako
			fuzzel
			alacritty
			i3status
		];
	};

	environment.loginShellInit = ''
   		 [[ "$(tty)" == /dev/tty1 ]] && sway --unsupported-gpu
	'';
}
