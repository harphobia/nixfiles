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
