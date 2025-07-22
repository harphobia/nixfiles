{lib, config, pkgs, ... }:
let
    #command = "bin/nbfc_service --config-file '/home/${config.modules.utils.nbfc.user}/.config/nbfc.json'";
    command = "bin/nbfc_service --config-file '/etc/nbfc/config.json'";
in
{
    options = {
        modules.utils.nbfc.enable = lib.mkEnableOption "nbfc-linux";
        modules.utils.nbfc.model = lib.mkOption {
            description = "model laptop";
            default = "";
        };
    };

    config = lib.mkIf config.modules.utils.nbfc.enable  {
        environment.systemPackages = with pkgs; [ nbfc-linux ];
        environment.etc."nbfc/config.json".text = ''
            {"SelectedConfigId": "${config.modules.utils.nbfc.model}"}
        '';

        systemd.services.nbfc_service = {
            enable = true;
            description = "NoteBook FanControl service";
            serviceConfig.Type = "simple";
            path = [pkgs.kmod];
            script = "${pkgs.nbfc-linux}/${command}";
            wantedBy = ["multi-user.target"];
        };
    };
}
