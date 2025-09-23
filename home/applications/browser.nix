{pkgs, ...}:
{
	programs.chromium = {
		enable = true;
		package = pkgs.brave;
		extensions = [
			"ghmbeldphafepmbegfdlkpapadhbakde" # proton pass
			"jinjaccalgkegednnccohejagnlnfdag" # violentmonkey
			"hjpaapdjcgbmeikfnahipphknonhlhib" # torn tools
		];
	};
}
