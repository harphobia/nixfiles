{ self, inputs, ... }: {
	flake.overlays.nbfc-linux = final: prev: {
		nbfc-linux = prev.nbfc-linux.overrideAttrs (oldAttrs: {
				nativeBuildInputs = (oldAttrs.nativeBuildInputs or [ ]) ++ [ prev.jq ];

				postInstall = (oldAttrs.postInstall or "") + ''
				target="$out/share/nbfc/configs/Acer Nitro AN515-57.json"

				${prev.jq}/bin/jq '.RegisterWriteConfigurations[0] = {
				"WriteMode": "Set",
				"WriteOccasion": "OnInitialization",
				"Register": 3,
				"Value": 82,
				"ResetRequired": true,
				"ResetValue": 65,
				"ResetWriteMode": "Set",
				"Description": "Make manual fan control possible for AC"
				}' "$target" > target.tmp && mv target.tmp "$target"
				'';
				});
	};
}
