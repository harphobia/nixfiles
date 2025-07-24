{pkgs, lib, config, ...}:
{
    programs.tmux = {
        enable = true;
        clock24 = true;
        extraConfig = ''
            set -g default-command "${SHELL}"

        '';
    }
}
