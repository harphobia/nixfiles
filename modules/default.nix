{ ... }:
{
    imports = [
        ./nvidia.nix
        ./tlp.nix
        ./nbfc-linux.nix
    	./docker.nix
        ./utils.nix
        ./zsh.nix
        ./niri.nix
        ./steam.nix
        ./vm.nix
	    ./fonts.nix
	    ./print.nix
	    ./flatpak.nix
    ];
}
