{pkgs, lib, config, ...}:
{
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
			keymaps = {
				"<Leader>ff" = "find_files";
				"<Leader>fg" = "live_grep";
				"<Leader>fb" = "buffers";
				"<Leader>fh" = "help_tags";
				"<Leader>ft" = "file_browser";
			};
			extensions.file-browser = {
				enable = true;
				settings = {
					hijack_netrw = true;
				};
			};

			extensions.advanced-git-search = {
				enable = true;
				settings = {
					diff_plugin = "diffview";
				};
			};
		};
		plugins.web-devicons.enable = true;
	};
}
