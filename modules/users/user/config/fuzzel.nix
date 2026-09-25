{ self, inputs, ... }: {
	flake.homeModules.fuzzel = { ... }: {
		programs.fuzzel = {
			enable = true;
			settings = {
				main = {
					font = "monospace:size=6";
					icons-enabled = false;
					width = 35;
					lines = 5;
					horizontal-pad = 3;
					vertical-pad = 3;
					prompt = "";
				};

				colors = {
					background = "0e0e0eff";
					text = "eeeeeeff";
					match = "555555ff";
					selection = "222222ff";
					selection-text = "ffffffff";
					border = "555555ff";
				};

				border = {
					width = 0;
					radius = 0;
				};
			};
		};

		xdg.configFile."fuzzel/scripts/fuzzel-status.sh" = {
		      text = ''
			#!/usr/bin/env bash

			# 1. Gather Date & Time info in ISO format
			DATE_STR=$(date "+%Y-%m-%d │ %H:%M:%S")

			# 2. Gather Battery info
			BAT_DIR="/sys/class/power_supply/BAT1"
			if [ -d "$BAT_DIR" ]; then
			    CAPACITY=$(cat "$BAT_DIR/capacity")
			    STATUS=$(cat "$BAT_DIR/status")
			    
			    if [ "$STATUS" = "Charging" ]; then
				BATT_STR="$CAPACITY% | CHR"
			    else
				BATT_STR="$CAPACITY% | BAT"
			    fi
			else
			    BATT_STR="AC Only"
			fi

			# 3. Combine into a compact status string
			STATUS_LINE="$DATE_STR │ $BATT_STR"

			# 4. Launch normal Fuzzel with the status line as the placeholder
			fuzzel --placeholder=" $STATUS_LINE"
		      '';
		      executable = true; 
	    };
	};
}
