{lib, config, pkgs, ... }:
{
    options = {
        modules.utils.tlp.enable =  lib.mkEnableOption "tlp";
    };


    config = lib.mkIf config.modules.utils.tlp.enable {
        services.power-profiles-daemon.enable = false;
        services.tlp = {
            enable = true;
            settings = {
                SOUND_POWER_SAVE_ON_AC = 0;
                SOUND_POWER_SAVE_ON_BAT = 0;
                CPU_BOOST_ON_AC = 1;
                CPU_BOOST_ON_BAT = 0;
                CPU_MAX_PERF_ON_AC = 83;
                CPU_MAX_PERF_ON_BAT = 65;
            };
        };
    };
}
