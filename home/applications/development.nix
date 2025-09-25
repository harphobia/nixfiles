{ pkgs, ...}:
{
	home.packages = with pkgs; [
		lazygit
		lazysql
		lazydocker
		vscode
	];
}
