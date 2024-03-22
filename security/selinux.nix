# SELinux Configuration
# <https://nixos.wiki/wiki/Workgroup:SELinux>
{pkgs, ...}: {
  boot.kernelParams = ["security=selinux"];

  # SELinux support in the kernel
  # Also support for other LSM modules
  boot.kernelPatches = [
    {
      name = "selinux-config";
      patch = null;
      extraConfig = ''
        SECURITY_SELINUX y
        AUDIT y
        SECURITY_SELINUX_BOOTPARAM n
        SECURITY_SELINUX_DISABLE n
        SECURITY_SELINUX_DEVELOP y
        SECURITY_SELINUX_AVC_STATS y
        SECURITY_SELINUX_CHECKREQPROT_VALUE 0
        DEFAULT_SECURITY_SELINUX n
      '';
    }
  ];

  environment.systemPackages = with pkgs; [
    policycoreutils # SELinux policy core utilities (load_policy, fixfiles, setfiles, setsebool, semodile, and sestatus)
    semodule-utils # SELinux policy core utilities (packaging additions)
    selinux-sandbox
  ];

  # Build systemd with SELinux support
  # loads policy at boot and supports file labelling
  systemd.package = pkgs.systemd.override {withSelinux = true;};
}
