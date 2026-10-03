{ self, inputs, ... }: {
	flake.homeModules.dev = { pkgs, ... }: {
		home.packages = with pkgs;[
			lazygit
			lazysql
			zed-editor
		];
	};
}
