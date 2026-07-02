{self, inputs, ...}:
{
    flake.nixosModules.nbfc = { pkgs, ... }:
    let
        command = "bin/nbfc_service --config-file '/etc/nbfc/config.json'";
    in
    {
        environment.systemPackages = with pkgs; [ nbfc-linux ];
        environment.etc."nbfc/config.json".text = ''
            {"SelectedConfigId": "Acer Nitro AN515-57"}
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