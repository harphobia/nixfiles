{ config, pkgs, inputs, ... }:
{
	home.packages = with pkgs;[
		aria2
		ncspot
		lf
        btop
	];
}
