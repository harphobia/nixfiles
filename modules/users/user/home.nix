{ self, inputs, ... }: {
      flake.homeModules.user = { ... }: {
  		  imports = [
			inputs.niri-flake.homeModules.niri
			inputs.nixvim.homeModules.nixvim

			self.homeModules.git
			self.homeModules.bash
			self.homeModules.fuzzel
			self.homeModules.mako
			self.homeModules.niri
			self.homeModules.ghostty
			self.homeModules.theme
			self.homeModules.udiskie
			self.homeModules.dev
			self.homeModules.neovim
  		  ];

	      home.username = "user";
	      home.homeDirectory = "/home/user";
	      home.stateVersion = "26.11";
      };
}
