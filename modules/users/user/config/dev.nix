{ self, inputs, ... }: {
	flake.homeModules.dev = { pkgs, ... }: {
		home.packages = with pkgs;[
			bun
			biome
			nodejs
			rustup
			uv
			nixd
			lazygit
			lazysql
			zed-editor
		];
	};
}
