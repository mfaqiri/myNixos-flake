{...}: {

    wayland.windowManager.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        checkConfig = true;
        systemd.enable = true;
        package = null;
        config = {
            modifier = "Mod4";
            terminal = "kitty";
            bars = [ "waybar" ];
            input = {
                "0:0:OpenTabletDriver_Virtual_Tablet" = {
                    map_to_output = "DP-1";
                };
            };
            output = {
                "DP-3" = {
                    mode = "2560x1440@144Hz pos 0 0";
                }; 
                "DP-1" = {
                    mode = "3840x2160@144Hz pos 2560 0";
                }; 
                "DP-2" = {
                    mode = "2560x1440@60Hz pos 6400 0 transform 270";
                }; 
                "HDMI-A-1" = {
                    mode = "3840x2160 pos 7840 0";
                }; 
            };
        };

    };

    programs = {
        waybar = {
            enable = true;
        };

        fuzzel.enable = true;
    };


}
