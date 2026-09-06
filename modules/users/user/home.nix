{ self, inputs, ... }: {
      flake.homeModules.user = { ... }: {
		  imports = [
  			inputs.niri-flake.homeModules.niri
  			inputs.noctalia.homeModules.default

  			self.homeModules.git
  			self.homeModules.bash
  			self.homeModules.theme
  			self.homeModules.udiskie
  			self.homeModules.ghostty
  			self.homeModules.niri
  			self.homeModules.noctalia
		  ];

	      home.username = "user";
	      home.homeDirectory = "/home/user";
	      home.stateVersion = "26.11";
      };
}
