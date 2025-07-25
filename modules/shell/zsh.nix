{lib, config, pkgs, ... }:
{
    options = {
        modules.shell.zsh.enable =  lib.mkEnableOption "zsh";
    };


    config = lib.mkIf config.modules.shell.zsh.enable {
        users.defaultUserShell=pkgs.zsh;
	system.userActivationScripts.zshrc = "touch .zshrc";
        programs.zsh = {
            enable = true;
            autosuggestions.enable = true;
            zsh-autoenv.enable = true;
            syntaxHighlighting.enable = true;
            ohMyZsh = {
                enable = true;
                theme = "simple";
                plugins = [
                    "git"
                    "history"
                ];
            };
        };
    };
}
