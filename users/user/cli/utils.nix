{ config, pkgs, inputs, ... }:
{
	home.packages = with pkgs;[
		aria2
        rustup
		ncspot
		lf
		lazysql
		lazydocker
	];
}
