{
  pkgs,
  lib,
  ...
}: {
  boot = {
    # Search for (in nixpkgs): linuxKernel.kernels hardened
    kernelPackages = lib.mkDefault pkgs.linuxKernel.packages.linux_hardened;
    kernelModules = ["tcp_bbr"];
    kernel.sysctl = {
      # Disable magic SysRq key
      "kernel.sysrq" = 0;
      # Disable NMI watchdog
      "kernel.nmi_watchdog" = 0;
      # To hide any kernel messages from the console
      "kernel.printk" = "3 3 3 3";
      # Only swap when absolutely necessary
      "vm.swappiness" = 10;
      # Ignore ICMP broadcasts to avoid participating in Smurf attacks
      "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
      # Ignore bad ICMP errors
      "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
      # Reverse-path filter for spoof protection
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.conf.all.rp_filter" = 1;
      # SYN flood protection
      "net.ipv4.tcp_syncookies" = 1;
      # Do not accept ICMP redirects (prevent MITM attacks)
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
      # Do not send ICMP redirects (we are not a router)
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.send_redirects" = 0;
      # Do not accept IP source route packets (we are not a router)
      "net.ipv4.conf.all.accept_source_route" = 0;
      "net.ipv6.conf.all.accept_source_route" = 0;
      # Protect against tcp time-wait assassination hazards
      "net.ipv4.tcp_rfc1337" = 1;
      # Latency reduction
      "net.ipv4.tcp_fastopen" = 3;
      # Bufferfloat mitigations
      # Requires >= 4.9 & kernel module
      "net.ipv4.tcp_congestion_control" = "bbr";
      # Requires >= 4.19
      "net.core.default_qdisc" = "cake";
      # Increase the TCP receive and transmit buffer sizes
      "net.core.rmem_max" = 16777216;
      "net.core.wmem_max" = 16777216;
      # Enable TCP window scaling and timestamps
      "net.ipv4.tcp_window_scaling" = 1;
      "net.ipv4.tcp_timestamps" = 1;
      # Increase the maximum number of open file descriptors
      "fs.file-max" = 65535;
    };

    blacklistedKernelModules = [
      # Obsecure network protocols
      "ax25"
      "netrom"
      "rose"

      # Old/rare or insufficiently audited filesystems
      "adfs"
      "affs"
      "bfs"
      "befs"
      "cramfs"
      "efs"
      "erofs"
      "exofs"
      "freevxfs"
      "f2fs"
      "vivid"
      "gfs2"
      "ksmbd"
      "nfsv4"
      "nfsv3"
      "cifs"
      "nfs"
      "cramfs"
      "freevxfs"
      "jffs2"
      "hfs"
      "hfsplus"
      "squashfs"
      "udf"
      "btusb"
      "hpfs"
      "jfs"
      "minix"
      "nilfs2"
      "omfs"
      "qnx4"
      "qnx6"
      "sysv"
    ];
  };
}
