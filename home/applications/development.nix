{ pkgs, ...}:
{
	home.packages = with pkgs; [
		lazygit
		lazysql
		lazydocker
		vscode
	];

	programs.java = { 
		enable = true;
		package = pkgs.temurin-bin;
	};
}
