{pkgs, ...}:
{
    programs.niri.enable = true;
    services.switcherooControl.enable = true;
    environment.systemPackages = with pkgs; [
        easyeffects
		helvum
		pavucontrol
        eog
        evince
        gnome-clocks
        gnome-text-editor
        gnome-calculator
        gnome-clocks
    ];
}