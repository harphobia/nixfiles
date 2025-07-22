{ inputs, lib, config, pkgs, ... }:
let
    home-manager = inputs.home-manager;
in
{
    imports = [
         (import "${home-manager}/nixos")
    ];

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

        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;
        home-manager.users.user = import ./home.nix;
    };
}
