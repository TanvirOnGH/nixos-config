# Power Management Configuration
_: {
  # To check cpu governor: cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  powerManagement.cpuFreqGovernor = "performance";

  /*
  services.hddfancontrol = {
    enable = false;
    extraArgs = ["--spin-down-time=60"];
    disks = [
      "/dev/disk/by-uuid/" # /mnt/_1
      "/dev/disk/by-uuid/" # /mnt/_2
      "/dev/disk/by-uuid/" # /mnt/_3
    ];
    pwmPaths = [
      "/sys/class/hwmon/hwmon1/device"
    ];
  };
  */
}
