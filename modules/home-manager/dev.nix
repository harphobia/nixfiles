{ pkgs, lib, config, ...}:
{
    home.packages = with pkgs; [
        rustup
        lazygit
        lazysql
        lazydocker
        nodejs_22
        bun
        deno
        php
        vscode
    ];
    
	programs.java = { 
		enable = true;
		package = pkgs.temurin-bin;
	};
}
