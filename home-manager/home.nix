{ config, pkgs, ... }:

{
    imports = [
          ./nvim/nvim.nix
    ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.

  # The home.packages option allows you to install Nix packages into your
  # environment.
    fonts.fontconfig.enable = true;


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.

	programs = {

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
          ll = "ls -l";
          update = "sudo nixos-rebuild switch --flake /home/mfaqiri/mysystem#myNixos";
      };

      zplug = {
          enable = true;
          plugins = [
                    { name = "zsh-users/zsh-autosuggestions"; }
                    {
                        name = "ergenekonyigit/lambda-gitster";
                        tags = [ "as:theme" ];
                    }

                ];
            };


        history.size = 10000;
        history.ignoreAllDups = true;
        history.path = "$HOME/.zsh_history";
    };
    yazi.enable = true;

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };

 };



    dconf.settings = {
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };

    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };



  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mfaqiri/etc/profile.d/hm-session-vars.sh
  #


  # Let Home Manager install and manage itself.
}
