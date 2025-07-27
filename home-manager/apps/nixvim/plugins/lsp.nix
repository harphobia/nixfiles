{pkgs, lib, config, ...}:
{
	programs.nixvim.lsp = {
		inlayHints.enable = true;
		servers = {
			"*" = {
				enable = true;
				name = "*";
			};
			biome = {
				activate = true;
				settings = {
					filetypes = [
						"js" "mjs" "ts"
						"jsx" "tsx"
					];
					root_markers = [ "package.json" "biome.json" ];
				};
			};
			rust_analyzer = {
				activate = true;
				settings = {
					filetypes = [ "rs" ];
					root_markers = [ "Cargo.toml" ];
				};
			};
			pylsp = {
				activate = true;
				settings = {
					filetypes = [ "py" ];
				};
			};
		};
	};
}
