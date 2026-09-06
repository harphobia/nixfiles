{ self, inputs, ... }: {
     flake.homeModules.ghostty = { ... }: {
        programs.ghostty = {
            enable = true;
            settings = {
		theme = "noctalia";
                font-family = "Hack Nerd Font";
                font-size = 10;
                adjust-cell-height = 1;
                window-padding-x = 3;
                window-padding-y = 3;
                app-notifications = false;
            };
        };
     };
}
