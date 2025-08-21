{ config, pkgs, inputs, ... }:
{
	home.packages = with pkgs; [
		aria2
		gimp3
	];
}
