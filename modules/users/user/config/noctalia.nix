{ self, inputs, ... }: {
     flake.homeModules.noctalia = { ... }: {
         programs.noctalia.enable = true;
     };
}