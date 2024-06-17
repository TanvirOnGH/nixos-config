# Services Configuration
{pkgs, ...}: {
  # For programs like gparted (that requires root permission) to work
  # <https://nixos.wiki/wiki/Polkit>
  security.polkit.enable = true;

  systemd.user.services = {
    polkit-kde-authentication-agent-1 = {
      description = "polkit-kde-authentication-agent-1";
      wantedBy = ["xdg-desktop-portal.service"];
      wants = ["xdg-desktop-portal.service"];
      after = ["xdg-desktop-portal.service"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };

    /*
    polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["xdg-desktop-portal.service"];
      wants = ["xdg-desktop-portal.service"];
      after = ["xdg-desktop-portal.service"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
    */

    # <https://github.com/nix-community/nur-combined/blob/master/repos/xddxdd/pkgs/uncategorized/flaresolverr/default.nix>
    /*
    flaresolverr = {
      after = ["network.target"];
      environment = {
        LOG_LEVEL = "info";
        LOG_HTML = "false";
        CAPTCHA_SOLVER = "hcaptcha-solver";
        TZ = "Asia/Dhaka";
      };
      serviceConfig = {
        User = config.services.jackett.user;
        Group = config.services.jackett.group;
        Restart = "always";
        RestartSec = 5;
        TimeoutStopSec = 30;
        ExecStart = "${pkgs.nur.repos.xddxdd.flaresolverr}/bin/flaresolverr";
      };
      wantedBy = ["multi-user.target"];
    };
    */
  };

  services = {
    #- <https://nixos.wiki/wiki/BOINC>
    /*
    boinc = {
      enable = true;
      dataDir = "/var/lib/boinc"; # use with boincmgr --datadir /var/lib/boinc
    };
    */

    teamviewer.enable = false;
    vnstat.enable = true;
    aria2.enable = false; # WebUI: <http://localhost:6800>
    fstrim.enable = false;

    # USB Automounting
    # <https://nixos.wiki/wiki/PCManFM#USB_Automounting>
    udisks2.enable = true;
    devmon.enable = true;

    gnome.gnome-keyring.enable = true; # Keyring for SSH
    blueman.enable = true; # GUI Bluetooth Manager
    cpupower-gui.enable = false; # GUI for CPU power management
    packagekit.enable = false; # Required for KDE Discover

    # <https://nixos.wiki/wiki/Btrfs#Scrubbing>
    btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = ["/"];
    };

    xmr-stak = {
      enable = false;
      openclSupport = false;
      # cudaSupport = true;
    };

    xmrig = {
      enable = false;
      package = pkgs.xmrig-mo;
      settings = builtins.fromJSON (builtins.readFile ../../configs/monero.json);
    };

    syncthing = {
      enable = false; # WebUI (Default): <http://localhost:8384>
      # user = "user";
      # guiAddress = "127.0.0.1:9999";
    };

    # Keybase
    keybase.enable = true;
    kbfs = {
      enable = true;
      enableRedirector = false;
      mountPoint = "%h/keybase";
      extraFlags = [
        "-label kbfs"
      ];
    };

    # K3s
    #- <https://nixos.wiki/wiki/K3s>
    k3s = {
      enable = false;
      role = "server";
    };

    # TODO: tor, i2p, lokinet, freenet, gnunet

    # IPFS
    #- <https://nixos.wiki/wiki/IPFS>
    kubo = {
      enable = false;
      defaultMode = "online";
      startWhenNeeded = false;
      autoMount = true; # /ipfs and /ipns
      autoMigrate = true;
      enableGC = true; # Garbage collection
      settings.Addresses.API = "/ip4/127.0.0.1/tcp/5001"; # WebUI: <http://127.0.0.1:5001/webui>
      # Default data dir: /var/lib/ipfs/
    };

    #- <https://nixos.wiki/wiki/Tor>
    tor = {
      enable = false;
      client.enable = true;
      openFirewall = true;

      relay = {
        enable = true;
        role = "relay";
      };

      settings = {
        ORPort = 9001;
        ControlPort = 9051;
        BandWidthRate = "100 MBytes";
      };

      /*
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/obfs4proxy";
      Bridge = "obfs4 IP:ORPort [fingerprint]"
      */
    };

    # Downloads dir: /var/lib/freenet/.local/share/freenet/./downloads
    freenet.enable = false; # WebUI: <http://localhost:8888>

    zeronet = {
      enable = false;
      #- <https://github.com/NixOS/nixpkgs/pull/173900>
      package = pkgs.zeronet-conservancy; # maintained community fork of zeronet
      # port = 7110; # default: 43110
      # fileserverPort = 7111; # default: 12261
      # tor = true; # Only use Tor for Tor network peers
      # torAlways = false; # Use Tor for every connections to hide your IP address (slower)
      # Default data dir: /var/lib/zeronet/
    };

    # https://nixos.wiki/wiki/SSH_public_key_authentication
    openssh = {
      enable = false;
      settings = {
        passwordAuthentication = true; # setting it to false requires public key authentication for better security
        kbdInteractiveAuthentication = false;
        PermitRootLogin = "yes";
      };
    };

    mpd = {
      enable = false; # Music Player Daemon
      startWhenNeeded = true;
    };

    ympd.enable = false; # WebUI for MPD. <http://localhost:6600>

    # For thunar
    gvfs.enable = true; # Mount, trash, and other functionalities (e.g. in Thunar)
    tumbler.enable = true; # Thumbnail support for images

    # DBus service that allows applications to update firmware
    # <https://nixos.wiki/wiki/Fwupd>
    fwupd.enable = false;

    /*
    deluge = {
      enable = true;
      web.enable = true;
    };
    */

    #- <https://usbguard.github.io>
    /*
    usbguard = {
      enable = true;
      dbus.enable = true;
      implicitPolicyTarget = "block";
      # change {id} to trusted USB device, (find ids using lsusb)
      rules = ''
        allow id {id} # device 1
        allow id {id} # device 2
      '';
    };
    */

    # TODO: setup Jellyfin
    #- <https://nixos.wiki/wiki/Jellyfin>
    #- <https://jellyfin.org>
    #- <https://github.com/jellyfin/jellyfin-media-player>
    # services.jellyfin.enable = true;

    # TODO: setup kodi

    # TODO: setup PhotoPrism
    #- <https://nixos.wiki/wiki/PhotoPrism>

    # <https://github.com/Jackett/Jackett>
    jackett.enable = true; # WebUI: http://127.0.0.1:9117

    # <https://nixos.wiki/wiki/GNOME#Running_ancient_applications>
    dbus.packages = with pkgs; [gnome2.GConf];

    # Automatically lock the screen after a period of inactivity
    xserver.xautolock = {
      enable = false;
      enableNotifier = true;
      time = 10; # in minutes
      notify = 10; # in seconds
      killtime = 120; # in minutes
      locker = "${pkgs.i3lock-fancy-rapid}/bin/i3lock-fancy-rapid 5 5";
      notifier = "${pkgs.libnotify}/bin/notify-send 'Locking in 10 seconds'";
      # killer = "/run/current-system/systemd/bin/systemctl suspend";
    };
  };

  # To avoid system freeze
  systemd.oomd.enable = true;
  services.earlyoom = {
    enable = true;
    enableNotifications = true;
    freeMemThreshold = 3;
    freeSwapThreshold = 9;
  };
}
