{self, inputs, ...}:
{
    flake.nixosModules.utils = { pkgs, ... } : {
        environment.systemPackages = with pkgs; [
            vim
            git
            home-manager
        ]
    };
}