{ self, inputs, ... }: {
      flake.homeModules.user = { ... }: {
  		  imports = [
     			self.homeModules.git
     			self.homeModules.bash
  		  ];

	      home.username = "user";
	      home.homeDirectory = "/home/user";
	      home.stateVersion = "26.11";
      };
}
