#Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, ... }: {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./desktop-host/desktopbundle.nix
      ./nixosModules/modulebundle.nix
    ];



 nixpkgs.config.allowUnfree = true;

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/New_York";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;





  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  security = {
    polkit.enable = true;

    pam.loginLimits = [{
      domain = "*";
      type = "-";
      item = "memlock";
      value = "infinity";


    }];
    };


  users = {
  	users = {
	  mfaqiri = {
	    isNormalUser = true;
	    extraGroups = [ "wheel" "power" "storage" "networkmanager" "sudo" "audio" "video" "tss" "libvirtd" "rtkit" ]; # Enable ‘sudo’ for the user.
  };
  };
  };



  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
 	blender
	wget
	clinfo
	home-manager
	mangohud
	mako
	fuzzel
	waybar
	ffmpeg
	grim
	slurp
	wineWowPackages.staging
	git
	protonup
	lutris
	heroic
	winetricks
	adwaita-icon-theme
	firefox

];




  services = {
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    xserver.enable = false;

    openssh.enable = true;

    flatpak.enable = true;
  
    ntp.enable = true;

  };






  xdg.portal = {
	enable = true;
	wlr.enable = true;
  };



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.

 programs = {

  gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

 	noisetorch.enable = true;
  	sway = {
		enable = true;
		wrapperFeatures.gtk = true;
	};
	gamemode.enable = true;
 	steam = {
		enable = true;
		remotePlay.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;
		gamescopeSession = {
		enable = true;
		env = {
			AMD_VULKAN_ICD = "RADV";
			DXVK_HDR = "1";
		};
		args = [
			"--adaptive-sync"
			"--hdr-enabled"
			"--hdr-itm-enable"
			"--rt"
			"--steam"
			"--prefer-output HDMI-A-1"
			"--output-width 3840"
			"--output-height 2160"
		];
		};
		};

 };





  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

