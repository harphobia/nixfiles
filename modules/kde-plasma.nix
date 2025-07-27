{lib, config, pkgs, ... }:
{
    options = {
        modules.desktop.kde.enable =  lib.mkEnableOption "kde plasma";
    };


    config = lib.mkIf config.modules.desktop.kde.enable {
        services.xserver.enable = true;

        # Enable the KDE Plasma Desktop Environment.
        services.displayManager.sddm.enable = true;
        services.displayManager.sddm.wayland.enable = true;
        services.desktopManager.plasma6.enable = true;
    };
}
