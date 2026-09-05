{ self, inputs, ... }: {
     flake.homeModules.bash = { ... }: {
        programs.bash = {
            enable = true;
            enableCompletion = true;
            shellAliases = {
                "nix-cleanup" = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
                "nix-flake-switch" = "sudo nixos-rebuild switch --flake .#nitro && home-manager switch --flake .#user";
            };
            profileExtra = ''

            '';
        };
     };
}