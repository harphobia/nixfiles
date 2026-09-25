{ self, inputs, ... }: {
      flake.homeModules.user = { ... }: {
  		  imports = [
     			self.homeModules.git
     			self.homeModules.bash
     			self.homeModules.niri
     			self.homeModules.fuzzel
     			self.homeModules.mako
  		  ];

	      home.username = "user";
	      home.homeDirectory = "/home/user";
	      home.stateVersion = "26.11";
      };
}
