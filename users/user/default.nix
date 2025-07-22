{ inputs, lib, config, pkgs, ... }:
{
    options = {
        users.user.enable =  lib.mkEnableOption "user";
    };

    config = lib.mkIf config.users.user.enable {

        users.users.user = {
            enable = true;
            isNormalUser = true;
            extraGroups = [ "networkmanager" "wheel" "docker" "gamemode" "adbusers"];
            shell = pkgs.zsh;
        };
    };
}
