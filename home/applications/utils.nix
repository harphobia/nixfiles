{pkgs, ...}:
{
	home.packages = with pkgs; [
		aria2
		gimp3
		vlc
	];
}
