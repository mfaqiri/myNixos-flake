{pkgs, ...}: {

    environment.systemPackages = with pkgs; [
	protonup
	lutris
	heroic
	winetricks
	wineWowPackages.staging
    shadps4
	mangohud
    ];

    programs = {
	    gamemode.enable = true;
 	    steam = {
		    enable = true;
		    remotePlay.openFirewall = true;
		    localNetworkGameTransfers.openFirewall = true;
		    gamescopeSession.enable = true;
		};

    };
}
