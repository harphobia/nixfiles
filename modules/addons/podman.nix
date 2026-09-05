{ self, inputs, ... }: {
      flake.nixosModules.docker = { pkgs, lib, ... }: {
        	virtualisation = {
                  containers.enable = true;

                  podman = {
                        enable = true;
                        dockerCompat = true;
                        defaultNetwork.settings.dns_enabled = true;
                  };
            };
      };
}