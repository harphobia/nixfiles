{ self, inputs, ... }: {

  flake.nixosModules.nitroConfiguration = { pkgs, ... }: {

    imports = [
		self.nixosModules.user
        ./hardware-configuration.nix

		self.nixosModules.bash
		self.nixosModules.fonts 
		self.nixosModules.nbfc-linux
		self.nixosModules.nvidia
		self.nixosModules.pipewire
		self.nixosModules.docker 
		self.nixosModules.printer 
		self.nixosModules.steam
		self.nixosModules.tlp
		self.nixosModules.utils
		self.nixosModules.vm
		self.nixosModules.niri
    ];

	nixpkgs.overlays = [
		inputs.niri-flake.overlays.niri
		self.overlays.nixpkgs-unstable
		self.overlays.nbfc-linux 
	];
    nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "os";
	networking.networkmanager.enable = true;

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
	
	zramSwap = {
		enable = true;
		priority = 100;
		algorithm = "lz4";
		memoryPercent = 50;
	};
	
	system.stateVersion = "26.05";
	boot.kernelPackages = pkgs.unstable.linuxPackages_zen;
  };

}