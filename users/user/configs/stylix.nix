{ inputs, pkgs, lib, config, ... }:
let
	stylix = inputs.stylix;
in
{
	stylix.cursor.package = pkgs.simp1e-cursors;
	stylix.cursor.name = "Simp1e-Catppuccin-Latte";
	stylix.cursor.size = 20;
}
