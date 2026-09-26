{ self, inputs, ... }: {
	flake.homeModules.theme = { pkgs, ... }: {
		home.packages = with pkgs; [
			adw-gtk3                
			adwaita-icon-theme      
			glib                    
		];

		gtk = {
			enable = true;

			gtk3.extraConfig = {
				gtk-application-prefer-dark-theme = 1;
			};

			gtk4.extraConfig = {
				gtk-application-prefer-dark-theme = 1;
			};

			theme = {
				name = "adw-gtk3-dark";
				package = pkgs.adw-gtk3;
			};

			iconTheme = {
				name = "Adwaita";
				package = pkgs.adwaita-icon-theme;
			};
			
			font = {
                                name = "Noto Sans 10";
                                package = pkgs.noto-fonts;
                        };
		};

		home.pointerCursor = {
			enable = true;
			name = "Adwaita";
			package = pkgs.adwaita-icon-theme;
			size = 16;
			gtk.enable = true;
			x11.enable = true;
		};

		qt = {
			enable = true;
			platformTheme.name = "gtk3";
			style = {
				name = "adwaita-dark";
				package = pkgs.adwaita-qt;
			};
		};

	};
}
