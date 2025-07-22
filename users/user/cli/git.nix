{pkgs, lib, config, ...}:
{
    home.packages = [ pkgs.git pkgs.lazygit ];
    programs.git = {
        enable = true;
        userName  = "Anhar Bisri";
        userEmail = "anharbisri@gmail.com";
    };
}
