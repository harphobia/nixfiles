{ lib, config, pkgs, ... }:
{
    nixpkgs.overlays = [
        ( import ./nbfc-overlay.nix)
    ];
}
