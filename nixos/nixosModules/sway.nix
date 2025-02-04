{pkgs, ...}:
{
    
   environment.systemPackages = with pkgs; [
        grim
        slurp
        mako
        fuzzel
    ]; 

    programs = {
        sway = {
           enable = true;
           wrapperFeatures.gtk = true;
        };

        waybar.enable = true;
    };

    xdg.portal = {
        enable = true;
        wlr.enable = true;
    };
}
