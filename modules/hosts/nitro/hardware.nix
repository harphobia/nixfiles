{self, input, ...}:
{
    flake.nixosModules.hardware-configuration = ./hardware-configuration.nix
}