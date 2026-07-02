{ self, inputs, ... }: {
  flake.homeModules.user = {...} :
  {
    home.username = "user";
    home.homeDirectory = "/home/user";
    home.stateVersion = "26.05";

    home.file.".xinitrc".source = ./config/.xinitrc
    home.file.".profile".source = ./config/.profile

    xdg.configFile."i3/config".source = ./config/i3.config
    xdg.configFile."i3status/config".source = ./config/i3status.config
    xdg.configFile."alacritty/alacritty.toml".source = ./config/alacritty.toml
  }
}