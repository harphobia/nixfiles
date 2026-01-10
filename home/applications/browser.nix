{pkgs, ...}:
{
	programs.chromium = {
		enable = true;
		package = pkgs.brave;
		extensions = [
			"ghmbeldphafepmbegfdlkpapadhbakde" # proton pass
			"hjpaapdjcgbmeikfnahipphknonhlhib" # torn tools
		];
	};
}
