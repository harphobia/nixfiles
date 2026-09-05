{ self, inputs, ... }: {
      flake.nixosModules.bash = { pkgs, lib, ... }: {
            programs.bash = {
                enable = true;
                completion.enable = true;
                shellAliases = {
                    rebuild = "sudo nixos-rebuild switch";
                };
            };
      };
}