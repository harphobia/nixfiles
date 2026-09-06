{ self, inputs, ... }: {
      flake.nixosModules.niri = { pkgs, lib, ... }: {
            programs.niri.enable = true;

            environment.systemPackages = with pkgs; [
                ghostty
                nautilus
                file-roller
                loupe
                wl-clipboard
                wlsunset
                xwayland-satellite
            ];

            xdg.portal = {
                enable = true;
                extraPortals = with pkgs; [
                    xdg-desktop-portal-gtk
                    xdg-desktop-portal-gnome
                ];
            };

            services.getty.autologinUser = "user";
            services.gnome.gnome-keyring.enable = lib.mkForce false;
            services.upower.enable = true;
      };
}