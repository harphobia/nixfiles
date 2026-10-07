{ self, inputs, ... }: {
	flake.homeModules.neovim = { pkgs, ... }: {
		home.packages = with pkgs; [ tree-sitter ];
		programs.nixvim = {
			enable = true;
			viAlias = true;
			defaultEditor = true;
			colorscheme = "adwaita";
			globals = {
                mapleader = " ";
            };
			opts = {
				number = true;
				relativenumber = true;
				shiftwidth = 4;
				tabstop = 4;
				expandtab = true;
				smartindent = true;
				termguicolors = true;
				cursorline = true;
				signcolumn = "yes";
				updatetime = 50;
			};
            extraPlugins = [
                pkgs.vimPlugins.adwaita-nvim
            ];
			plugins = {
				# addon for auto close symbol and tag
				autoclose.enable = true;
				
			
				# Git Integration
				gitsigns = {
					enable = true;
					settings.current_line_blame = true;
				};

				# Syntax Highlighting & Parsing
				treesitter = {
					enable = true;
					settings = {
						highlight.enable = true;
						indent.enable = true;
					};
				};

				# Fuzzy Finder (Telescope)
				telescope = {
					enable = true;
					keymaps = {
						"<leader>ff" = {
							action = "find_files";
							options.desc = "Telescope Find Files";
						};
						"<leader>fg" = {
							action = "live_grep";
							options.desc = "Telescope Live Grep";
						};
						"<leader>fb" = {
							action = "buffers";
							options.desc = "Telescope Buffers";
						};
						"<leader>ft" = {
							action = "file_browser";
							options.desc = "Telescope File Browser";
						};
					};
					extensions = {
						file-browser = {
							enable = true;
							settings = {
								hijack_netrw = true;
                                grouped = true;
                                cwd_to_path = true;
							};
						};
					};
				};

				# Language Server Protocol (LSP)
                tiny-inline-diagnostic.enable = true;
				lsp = {
					enable = true;
					servers = {
						lua_ls.enable = true;
                        nixd.enable = true;
                        biome.enable = true;
                        vtsls.enable = true;
                        marksman.enable = true;
                        texlab.enable = true;
                        rust_analyzer = {
                            enable = true;
                            installCargo = true;
                            installRustc = true;
                        };
					};
				};

				# Autocompletion Engine (nvim-cmp)
				cmp = {
					enable = true;
					autoEnableSources = true;
					settings = {
						sources = [
                            { name = "nvim_lsp"; }
                            { name = "path"; }
                            { name = "buffer"; }
						];
						mapping = {
							"<C-Space>" = "cmp.mapping.complete()";
							"<C-e>" = "cmp.mapping.abort()";
							"<CR>" = "cmp.mapping.confirm({ select = true })";
							"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
							"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
						};
					};
				};
			};
		};
	};
}
