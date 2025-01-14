{ config, pkgs, lib, ... }: {
    imports = [
        ./audio.nix
        ./video.nix
        ./disks.nix
        ./hardware.nix
        ./network.nix
        ./virtualisation.nix
    ];
}
