{ self, inputs, ... }: {
      flake.nixosModules.fonts = { pkgs, lib, ... }: {
        fonts.packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-color-emoji
            liberation_ttf
            corefonts
        ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
      };
}