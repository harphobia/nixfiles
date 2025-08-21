{pkgs, lib, config, ...}:
{
    home.packages = [ pkgs.git ];
    programs.git = {
        enable = true;
        userName  = "Anhar Bisri";
        userEmail = "anharbisri@gmail.com";
    };
}
