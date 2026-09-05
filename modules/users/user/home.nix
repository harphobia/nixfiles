{ self, inputs, ... }: {
      flake.homeModules.user = { ... }: {
		  imports = [
			self.homeModules.git
		  ];

	      home.username = "user";
	      home.homeDirectory = "/home/user";
	      home.stateVersion = "26.05";
      };
}