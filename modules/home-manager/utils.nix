{ config, pkgs, inputs, ... }:
{
	home.packages = with pkgs; [
		aria2
		gimp3
		blender_4_5
		vlc
	];
}
