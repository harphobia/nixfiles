{self, inputs, ...}:
{
    flake.nixosModules.i3 = {pkgs, ...}:
    {
        environment.pathsToLink = [ "/libexec" ];

        services.xserver = {
            enable = true;

            desktopManager = {
                xterm.enable = false;
            };

            displayManager.startx.enable = true;
        
            windowManager.i3 = {
                enable = true;
                extraPackages = with pkgs; [
                    dmenu
                    i3status
                ];
            };
        };

        environment.etc = {
            "profile.local".text = ''
                # /etc/profile.local: DO NOT EDIT -- this file has been generated automatically.
                if [ -f "$HOME/.profile" ]; then
                 "$HOME/.profile"
                fi
            '';
        };
    };
}