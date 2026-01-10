{pkgs, ...}:
{
	home.packages = with pkgs; [
		aria2
		vlc
		pavucontrol
		easyeffects
	];
}
