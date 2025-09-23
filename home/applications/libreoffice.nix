{pkgs, ...}:
{
    home.packages = with pkgs; [
        libreoffice-qt-still
        hunspell
        hunspellDicts.en_US
        hunspellDicts.id_ID
    ];
}
