# Power Management Configuration
{...}: {
  # To check cpu governor: cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  powerManagement.cpuFreqGovernor = "performance";

  /*
  services.hddfancontrol = {
    enable = false;
    extraArgs = ["--spin-down-time=60"];
    disks = [
      "/dev/disk/by-uuid/e34ed687-5ee1-47cd-83cb-c56c8ec38780" # /mnt/hdd
      "/dev/disk/by-uuid/93c845a5-2abd-4c56-b8d1-7f37271e827b" # /mnt/hdd2
      "/dev/disk/by-uuid/c1cf9ba8-18b8-49c2-89fe-8aacabfad79f" # /mnt/hdd3
    ];
    pwmPaths = [
      "/sys/class/hwmon/hwmon1/device"
    ];
  };
  */
}
