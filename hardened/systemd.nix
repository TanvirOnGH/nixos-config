# Systemd Hardening Configuration
# Based on: <https://www.reddit.com/r/NixOS/comments/1aqck9l/systemd_hardening_some_preconfigured_options_d/>
_: {
  systemd.services = {
    systemd-rfkill = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        MemoryDenyWriteExecute = true; #
        NoNewPrivileges = true;
        LockPersonality = true; #
        RestrictRealtime = true; #
        SystemCallFilter = [
          "write"
          "read"
          "openat"
          "close"
          "brk"
          "fstat"
          "lseek"
          "mmap"
          "mprotect"
          "munmap"
          "rt_sigaction"
          "rt_sigprocmask"
          "ioctl"
          "nanosleep"
          "select"
          "access"
          "execve"
          "getuid"
          "arch_prctl"
          "set_tid_address"
          "set_robust_list"
          "prlimit64"
          "pread64"
          "getrandom"
        ];
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any";
      };
    };

    syslog = {
      serviceConfig = {
        PrivateNetwork = true;
        CapabilityBoundingSet = ["CAP_DAC_READ_SEARCH" "CAP_SYSLOG" "CAP_NET_BIND_SERVICE"];
        NoNewPrivileges = true;
        PrivateDevices = true;
        ProtectClock = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        PrivateMounts = true;
        SystemCallArchitectures = "native";
        MemoryDenyWriteExecute = true;
        LockPersonality = true;
        ProtectKernelTunables = true;
        RestrictRealtime = true;
        PrivateUsers = true;
        PrivateTmp = true;
        UMask = "0077";
        RestrictNamespace = true;
        ProtectProc = "invisible";
        ProtectHome = true;
        DeviceAllow = false;
        ProtectSystem = "full";
      };
    };

    systemd-journald = {
      serviceConfig = {
        UMask = 0077;
        PrivateNetwork = true;
        ProtectHostname = true;
        ProtectKernelModules = true;
      };
    };

    auto-cpufreq = {
      serviceConfig = {
        CapabilityBoundingSet = "";
        ProtectSystem = "full";
        ProtectHome = true;
        PrivateNetwork = true;
        IPAddressDeny = "any";
        NoNewPrivileges = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectHostname = false;
        MemoryDenyWriteExecute = true;
        ProtectClock = true;
        RestrictNamespaces = true;
        PrivateTmp = true;
        PrivateUsers = true;
        ProtectProc = true;
        ReadOnlyPaths = ["/"];
        InaccessiblePaths = ["/home" "/root" "/proc"];
        SystemCallFilter = ["@system-service"];
        SystemCallArchitectures = "native";
        UMask = "0077";
      };
    };

    NetworkManager-dispatcher = {
      serviceConfig = {
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectHostname = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateUsers = true;
        PrivateDevices = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET";
        RestrictNamespaces = true;
        SystemCallFilter = [
          "write"
          "read"
          "openat"
          "close"
          "brk"
          "fstat"
          "lseek"
          "mmap"
          "mprotect"
          "munmap"
          "rt_sigaction"
          "rt_sigprocmask"
          "ioctl"
          "nanosleep"
          "select"
          "access"
          "execve"
          "getuid"
          "arch_prctl"
          "set_tid_address"
          "set_robust_list"
          "prlimit64"
          "pread64"
          "getrandom"
        ];
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any";
      };
    };

    display-manager = {
      serviceConfig = {
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectKernelLogs = true; # so we won't need all of this
      };
    };

    emergency = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true;
        PrivateDevices = true; # Might need adjustment for emergency access
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET";
        RestrictNamespaces = true;
        SystemCallFilter = [
          "write"
          "read"
          "openat"
          "close"
          "brk"
          "fstat"
          "lseek"
          "mmap"
          "mprotect"
          "munmap"
          "rt_sigaction"
          "rt_sigprocmask"
          "ioctl"
          "nanosleep"
          "select"
          "access"
          "execve"
          "getuid"
          "arch_prctl"
          "set_tid_address"
          "set_robust_list"
          "prlimit64"
          "pread64"
          "getrandom"
        ];
        UMask = "0077";
        IPAddressDeny = "any";
      };
    };

    "getty@tty1" = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true;
        PrivateDevices = true;
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET";
        RestrictNamespaces = true;
        SystemCallFilter = [
          "write"
          "read"
          "openat"
          "close"
          "brk"
          "fstat"
          "lseek"
          "mmap"
          "mprotect"
          "munmap"
          "rt_sigaction"
          "rt_sigprocmask"
          "ioctl"
          "nanosleep"
          "select"
          "access"
          "execve"
          "getuid"
          "arch_prctl"
          "set_tid_address"
          "set_robust_list"
          "prlimit64"
          "pread64"
          "getrandom"
        ];
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any";
      };
    };

    "getty@tty7" = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true;
        PrivateDevices = true;
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET";
        RestrictNamespaces = true;
        SystemCallFilter = [
          "write"
          "read"
          "openat"
          "close"
          "brk"
          "fstat"
          "lseek"
          "mmap"
          "mprotect"
          "munmap"
          "rt_sigaction"
          "rt_sigprocmask"
          "ioctl"
          "nanosleep"
          "select"
          "access"
          "execve"
          "getuid"
          "arch_prctl"
          "set_tid_address"
          "set_robust_list"
          "prlimit64"
          "pread64"
          "getrandom"
        ];
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any";
      };
    };

    NetworkManager = {
      serviceConfig = {
        NoNewPrivileges = true;
        ProtectClock = true;
        ProtectKernelLogs = true;
        ProtectControlGroups = true;
        ProtectKernelModules = true;
        SystemCallArchitectures = "native";
        MemoryDenyWriteExecute = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        RestrictNamespaces = true;
        ProtectKernelTunables = true;
        ProtectHome = true;
        PrivateTmp = true;
        UMask = "0077";
      };
    };

    "nixos-rebuild-switch-to-configuration" = {
      serviceConfig = {
        ProtectHome = true;
        NoNewPrivileges = true; # Prevent gaining new privileges
      };
    };

    "dbus" = {
      serviceConfig = {
        PrivateTmp = true;
        PrivateNetwork = true;
        ProtectSystem = "full";
        ProtectHome = true;
        SystemCallFilter = "~@clock @cpu-emulation @module @mount @obsolete @raw-io @reboot @swap";
        ProtectKernelTunables = true;
        NoNewPrivileges = true;
        CapabilityBoundingSet = [
          "~CAP_SYS_TIME"
          "~CAP_SYS_PACCT"
          "~CAP_KILL"
          "~CAP_WAKE_ALARM"
          "~CAP_SYS_BOOT"
          "~CAP_SYS_CHROOT"
          "~CAP_LEASE"
          "~CAP_MKNOD"
          "~CAP_NET_ADMIN"
          "~CAP_SYS_ADMIN"
          "~CAP_SYSLOG"
          "~CAP_NET_BIND_SERVICE"
          "~CAP_NET_BROADCAST"
          "~CAP_AUDIT_WRITE"
          "~CAP_AUDIT_CONTROL"
          "~CAP_SYS_RAWIO"
          "~CAP_SYS_NICE"
          "~CAP_SYS_RESOURCE"
          "~CAP_SYS_TTY_CONFIG"
          "~CAP_SYS_MODULE"
          "~CAP_IPC_LOCK"
          "~CAP_LINUX_IMMUTABLE"
          "~CAP_BLOCK_SUSPEND"
          "~CAP_MAC_*"
          "~CAP_DAC_*"
          "~CAP_FOWNER"
          "~CAP_IPC_OWNER"
          "~CAP_SYS_PTRACE"
          "~CAP_SETUID"
          "~CAP_SETGID"
          "~CAP_SETPCAP"
          "~CAP_FSETID"
          "~CAP_SETFCAP"
          "~CAP_CHOWN"
        ];
        ProtectKernelModules = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectControlGroups = true;
        RestrictNamespaces = true;
        MemoryDenyWriteExecute = true;
        RestrictAddressFamilies = ["~AF_PACKET" "~AF_NETLINK"];
        ProtectHostname = true;
        LockPersonality = true;
        RestrictRealtime = true;
        PrivateUsers = true;
      };
    };

    nix-daemon = {
      serviceConfig = {
        ProtectHome = true;
        PrivateUsers = false;
      };
    };

    reload-systemd-vconsole-setup = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        PrivateUsers = true;
        PrivateDevices = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictNamespaces = true;
        UMask = "0077";
        IPAddressDeny = "any";
      };
    };

    rescue = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true;
        PrivateDevices = true; # Might need adjustment for rescue operations
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET AF_INET6"; # Networking might be necessary in rescue mode
        RestrictNamespaces = true;
        SystemCallFilter = [
          "write"
          "read"
          "openat"
          "close"
          "brk"
          "fstat"
          "lseek"
          "mmap"
          "mprotect"
          "munmap"
          "rt_sigaction"
          "rt_sigprocmask"
          "ioctl"
          "nanosleep"
          "select"
          "access"
          "execve"
          "getuid"
          "arch_prctl"
          "set_tid_address"
          "set_robust_list"
          "prlimit64"
          "pread64"
          "getrandom"
        ];
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any"; # May need to be relaxed for network troubleshooting in rescue mode
      };
    };

    "systemd-ask-password-console" = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true;
        PrivateDevices = true; # May need adjustment for console access
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET AF_INET6";
        RestrictNamespaces = true;
        SystemCallFilter = ["@system-service"]; # A more permissive filter
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any";
      };
    };

    "systemd-ask-password-wall" = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true;
        PrivateDevices = true;
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET AF_INET6";
        RestrictNamespaces = true;
        SystemCallFilter = ["@system-service"]; # A more permissive filter
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any";
      };
    };

    thermald = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true; # Necessary for adjusting cooling policies
        ProtectKernelModules = true; # May need adjustment for module control
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true;
        PrivateDevices = true; # May require access to specific hardware devices
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        CapabilityBoundingSet = "";
        RestrictNamespaces = true;
        SystemCallFilter = ["@system-service"];
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any";
        DeviceAllow = [];
        RestrictAddressFamilies = [];
      };
    };

    "user@1000" = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true; # Be cautious, as this may restrict user operations
        PrivateDevices = true;
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET AF_INET6";
        RestrictNamespaces = true;
        SystemCallFilter = ["@system-service"]; # Adjust based on user needs
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any";
      };
    };

    virtlockd = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true;
        PrivateDevices = true; # May need adjustment for accessing VM resources
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET AF_INET6";
        RestrictNamespaces = true;
        SystemCallFilter = ["@system-service"]; # Adjust as necessary
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any"; # May need adjustment for network operations
      };
    };

    virtlogd = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true;
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true;
        PrivateDevices = true; # May need adjustment for accessing VM logs
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET AF_INET6";
        RestrictNamespaces = true;
        SystemCallFilter = ["@system-service"]; # Adjust based on log management needs
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any"; # May need to be relaxed for network-based log collection
      };
    };

    virtlxcd = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true; # Necessary for container management
        ProtectKernelModules = true;
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true; # Be cautious, might need adjustment for container user management
        PrivateDevices = true; # Containers might require broader device access
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET AF_INET6"; # Necessary for networked containers
        RestrictNamespaces = true;
        SystemCallFilter = ["@system-service"]; # Adjust based on container operations
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any"; # May need to be relaxed for network functionality
      };
    };

    virtqemud = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true; # Necessary for VM management
        ProtectKernelModules = true; # May need adjustment for VM hardware emulation
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true; # Be cautious, might need adjustment for VM user management
        PrivateDevices = true; # VMs might require broader device access
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET AF_INET6"; # Necessary for networked VMs
        RestrictNamespaces = true;
        SystemCallFilter = ["@system-service"]; # Adjust based on VM operations
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any"; # May need to be relaxed for network functionality
      };
    };

    virtvboxd = {
      serviceConfig = {
        ProtectSystem = "strict";
        ProtectHome = true;
        ProtectKernelTunables = true; # Required for some VM management tasks
        ProtectKernelModules = true; # May need adjustment for module handling
        ProtectControlGroups = true;
        ProtectKernelLogs = true;
        ProtectClock = true;
        ProtectProc = "invisible";
        ProcSubset = "pid";
        PrivateTmp = true;
        PrivateUsers = true; # Be cautious, might need adjustment for VM user management
        PrivateDevices = true; # VMs may require access to certain devices
        PrivateIPC = true;
        MemoryDenyWriteExecute = true;
        NoNewPrivileges = true;
        LockPersonality = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RestrictAddressFamilies = "AF_INET AF_INET6"; # Necessary for networked VMs
        RestrictNamespaces = true;
        SystemCallFilter = ["@system-service"]; # Adjust based on VM operations
        SystemCallArchitectures = "native";
        UMask = "0077";
        IPAddressDeny = "any"; # May need to be relaxed for network functionality
      };
    };
  };
}
