{pkgs, ... }:
let
    command = "bin/nbfc_service --config-file '/etc/nbfc/config.json'";
in
{
	nixpkgs.overlays = [(
	final: prev:
	{
	nbfc-linux = prev.nbfc-linux.overrideAttrs (oldAttrs: {
			postInstall = (oldAttrs.postInstall or "") + ''
			${prev.jq}/bin/jq '.RegisterWriteConfigurations[0] = {
			"WriteMode": "Set",
			"WriteOccasion": "OnInitialization",
			"Register": 3,
			"Value": 82,
			"ResetRequired": true,
			"ResetValue": 65,
			"ResetWriteMode": "Set",
			"Description": "Make manual fan control possible for AC"
			}' $out/share/nbfc/configs/Acer\ Nitro\ AN515-57.json > $out/share/nbfc/configs/Acer\ Nitro\ AN515-57.json.new
			mv $out/share/nbfc/configs/Acer\ Nitro\ AN515-57.json.new $out/share/nbfc/configs/Acer\ Nitro\ AN515-57.json
			'';
			});

	}
	)];

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
}
