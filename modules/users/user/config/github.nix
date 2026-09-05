{ self, inputs, ... }: {
     flake.homeModules.git = { ... }: {
        programs.git = {
            enable = true;
            settings = {
                user.name = "Anhar Bisri";
                user.email = "anharbisri@gmail.com";
            };
        };
     };
}