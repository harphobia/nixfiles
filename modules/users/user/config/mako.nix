{ self, inputs, ... }: {
	flake.homeModules.mako = { ... }: {
		services.mako = {
			enable = true;
			settings = {
				font = "monospace 8";
				width = 200;
				height = 75;
				margin = 12;
				padding = 3;
				border-size = 1;
				border-radius = 1;
				default-timeout = 3000;

				background-color = "#0e0e0e";
				text-color = "#eeeeee";
				border-color = "#555555";

				"urgency=high" = {
					border-color = "#888888";
					default-timeout = 0;
				};

				"urgency=low" = {
					background-color = "#0e0e0e";
					text-color = "#aaaaaa";
					border-color = "#222222";
				};
			};
		};
	};
}
