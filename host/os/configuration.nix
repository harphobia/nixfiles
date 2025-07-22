{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../users
      ../../modules
      ../../overlays
    ];

  # Users
  users.user.enable = true;

  # Modules
  modules.hardware.nvidia.enable = true;
  modules.utils.tlp.enable = true;
  modules.shell.zsh.enable = true;
  
  # Desktop
  modules.desktop.kde.enable = false;
  modules.desktop.gnome.enable = false;
  modules.desktop.hyprland.enable = true;

  # nbfc-linux-configs
  modules.utils.nbfc.enable = true;
  modules.utils.nbfc.model = "Acer Nitro AN515-57";

  # docker
  modules.utils.docker.enable = true; 
  modules.utils.docker.rootless.enable = true; 

  modules.utils.adb.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable automatic login for the user (chose getty or displayManager).
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "user";
  
  services.getty.autologinUser = "user";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    vim
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    corefonts
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  
  #OBS virtual camera
  programs.obs-studio.enableVirtualCamera = true;

  #game mode
  programs.gamemode.enable = true;

  #flatpak
  services.flatpak.enable = true;

  system.stateVersion = "25.05";

}
