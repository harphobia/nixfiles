{ self, inputs, ... }: {
	flake.homeModules.theme = { pkgs, ... }: {
		home.pointerCursor = {
			gtk.enable = true;
			package = pkgs.simp1e-cursors ;
			name = "Simp1e-Catppuccin-Latte";
			size = 16;
		};

		gtk = {
			enable = true;

			theme = {
				package = pkgs.gnome-themes-extra;
				name = "Adwaita-dark";
			};

			iconTheme = {
				package = pkgs.adwaita-icon-theme;
				name = "Adwaita";
			};

			font = {
				name = "Sans";
				size = 10;
			};
		};

		qt = {
			enable = true;
			style.name = "adwaita-dark";
		};

		dconf.settings = {
			"org/gnome/desktop/interface" = {
				color-scheme = "prefer-dark";
			};
		};
	};
}