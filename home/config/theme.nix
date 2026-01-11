{pkgs, ...}:
{
	home.pointerCursor = {
	    gtk.enable = true;
	    package = pkgs.bibata-cursors;
	    name = "Bibata-Modern-Classic";
	    size = 16;
	};

	gtk = {
		enable = true;
		colorScheme = "dark";
		theme = {
			name = "Adwaita-dark";
			package = pkgs.gnome-themes-extra;
		};
		
		iconTheme = {
			package = pkgs.adwaita-icon-theme;
			name = "Adwaita";
		};

		font = {
      			name = "Noto Sans";
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
}
