{ inputs, pkgs, lib, config, ... }:
let
	stylix = inputs.stylix;
in
{
	stylix.enable = true;

	stylix.base16Scheme ="${pkgs.base16-schemes}/share/themes/twilight.yaml";
	stylix.override = {
		base00 = "0e0e0e";
	};	

	stylix.cursor.package = pkgs.simp1e-cursors;
	stylix.cursor.name = "Simp1e-Catppuccin-Latte";
	stylix.cursor.size = 20;
}
