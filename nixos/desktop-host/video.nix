{ config, lib, pkgs, ... }: {

  nixpkgs.overlays = [(self: super: {
  	obs-studio = super.obs-studio.override { decklinkSupport = true; };
  }
  )];


  environment.systemPackages = with pkgs; [
	v4l-utils
	libsForQt5.kdenlive
	(pkgs.wrapOBS {
		plugins = with pkgs.obs-studio-plugins; [
			wlrobs
			obs-tuna
			obs-vaapi
			obs-gstreamer
			obs-vkcapture
			obs-multi-rtmp
		];
	})
    ];
}
