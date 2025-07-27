{ pkgs, lib, config, ...}:
{
    home.packages = with pkgs; [
        rustup
        lazygit
        lazysql
        nodejs_22
        bun
        deno
    ];
}
