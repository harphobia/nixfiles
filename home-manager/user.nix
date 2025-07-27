{ inputs, lib, config, pkgs, ... }:
{
    users.users.user = {
        enable = true;
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" "docker" "gamemode" "adbusers"];
        shell = pkgs.zsh;
    };

    # Enable automatic login for the user (chose getty or displayManager).
    # services.displayManager.autoLogin.enable = true;
    # services.displayManager.autoLogin.user = "user";
    services.getty.autologinUser = "user";

    programs.obs-studio.enableVirtualCamera = true;
    programs.gamemode.enable = true;
}