{ self, inputs, ... }: {
	flake.homeModules.ghostty = { ... }: {
		programs.ghostty = {
			enable = true;
			settings = {
				font-family = "Hack Nerd Font";
				font-size = 10;
				theme = "Apple System Colors";

				window-padding-x = 3;
				window-padding-y = 3;

				app-notifications = false;
				progress-style = false;
			};
		};
	};
}
