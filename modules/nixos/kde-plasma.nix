{lib, config, pkgs, ... }:
{
    options = {
        modules.kde.enable =  lib.mkEnableOption "kde plasma";
    };


    config = lib.mkIf config.modules.kde.enable {
        services.xserver.enable = true;

        # Enable the KDE Plasma Desktop Environment.
        services.displayManager.sddm.enable = true;
        services.displayManager.sddm.wayland.enable = true;
        services.desktopManager.plasma6.enable = true;

        xdg.portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-gtk
                xdg-desktop-portal-kde
            ];
        };
    };
}
