{ config, lib, ...}:
{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b25409dc-8bc6-4643-b4ac-3c563cafbd54";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5C56-C571";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/mnt/sda" =
    { device = "/dev/disk/by-uuid/f1ff429c-f8c8-402c-88d2-7cfe1f216169";
      fsType = "btrfs";
      options = [ "rw" "relatime" "ssd" "space_cache" "subvolid=5" "subvol=/" ];
    };
   fileSystems."/mnt/sdb" =
    { device = "/dev/disk/by-uuid/1bf00027-c365-4962-a63d-ecd2d4b70870";
      fsType = "ext4";
      options = [ "rw" "relatime" ];
    };

   fileSystems."/mnt/nvme1n1" =
    { device = "/dev/disk/by-uuid/11f3f850-412a-495d-939a-9ef29de0fffa";
      fsType = "ext4";
      options = [ "rw" "relatime" ];
    };


  swapDevices = [ {
     device = "/dev/nvme0n1p2";
  }];
}
