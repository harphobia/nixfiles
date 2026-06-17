{ self, inputs, ... }: {

  flake.nixosModules.nitro = { pkgs, ... }: {

    imports = [
		./hardware-configuration.nix
		self.nixosModules.users
		self.nixosModules.overlays
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
	networking.hostName = "os";

    boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	time.timeZone = "Asia/Jakarta";
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "id_ID.UTF-8";
		LC_IDENTIFICATION = "id_ID.UTF-8";
		LC_MEASUREMENT = "id_ID.UTF-8";
		LC_MONETARY = "id_ID.UTF-8";
		LC_NAME = "id_ID.UTF-8";
		LC_NUMERIC = "id_ID.UTF-8";
		LC_PAPER = "id_ID.UTF-8";
		LC_TELEPHONE = "id_ID.UTF-8";
		LC_TIME = "id_ID.UTF-8";
	};

	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};
	
	networking.networkmanager.enable = true;
	boot.kernelPackages = pkgs.unstable.linuxPackages_zen;
  };

}