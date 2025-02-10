{pkgs, ...}: {

    imports = [
        ./waybar.nix
    ];

    home.packages = with pkgs; [
        grim
        slurp
        mako
    ];

    wayland.windowManager.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        systemd.enable = true;
        checkConfig = true;
        config = {
            modifier = "Mod4";
            terminal = "kitty";
            bars = [{ statusCommand = "${pkgs.waybar}/bin/waybar"; }];

            startup = [
                {
                    command = "otd-daemon";
                }

                {
                    command = "xrandr --output DP-1 --primary";
                }
            ];


            menu = "fuzzel";
            output = {
                DP-3 = {
                    mode = "2560x1440@144Hz pos 0 0";
                }; 
                DP-1 = {
                    mode = "3840x2160@144Hz pos 2560 0";
                }; 
                DP-2 = {
                    mode = "2560x1440@60Hz pos 6400 0 transform 270 scale 1.4";
                }; 
                HDMI-A-1 = {
                    mode = "3840x2160 pos 7840 0";
                }; 
            };
        };

    };


}
