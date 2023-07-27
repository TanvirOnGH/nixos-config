# Kernel Configuration
#- <https://nixos.wiki/wiki/Linux_kernel>
# Kernel Configuration
{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = ["quiet" "mitigations=off" "numa=off" "idle=poll"];
    kernelPatches = [
      {
        name = "crashdump-config";
        patch = null;
        # check via: zcat /proc/config.gz
        extraConfig = ''
          MNATIVE_AMD y
          CC_OPTIMIZE_FOR_PERFORMANCE y
          KERNEL_ZSTD y
          MODULE_COMPRESS_XZ n
          MODULE_COMPRESS_ZSTD y
          HZ 1000
          HZ_500 n
          HZ_1000 y
          PREEMPT_VOLUNTARY n
          PREEMPT y
          SPECULATION_MITIGATIONS n
          CPU_FREQ_DEFAULT_GOV_PERFORMANCE y
          CPU_FREQ_STAT y
          X86_AMD_PSTATE y
        '';
      }
    ];
  };
}
