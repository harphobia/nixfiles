{pkgs, ...}:
{
    users.users.user = {
        enable = true;
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" "docker" "gamemode" "adbusers" "libvirtd" "kvm" "qemu" ];
        shell = pkgs.zsh;
    };

   services.getty.autologinUser = "user";
}
