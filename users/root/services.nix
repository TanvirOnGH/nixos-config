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
    aria2.enable = true; # WebUI: <http://localhost:6800>
    fstrim.enable = true;
    udisks2.enable = true;
    gnome.gnome-keyring.enable = true; # Keyring for SSH
    blueman.enable = true; # GUI Bluetooth Manager
    cpupower-gui.enable = false; # GUI for CPU power management
    packagekit.enable = false; # Required for KDE Discover

    xmr-stak = {
      enable = false;
      openclSupport = false;
      cudaSupport = true;
    };

    xmrig = {
      enable = false;
      package = pkgs.xmrig-mo;
      settings = builtins.fromJSON (builtins.readFile ./config/monero.json);
    };

    syncthing = {
      enable = false; # WebUI (Default): <http://localhost:8384>
      # user = "user";
      # guiAddress = "127.0.0.1:9999";
    };

    # K3s
    #- <https://nixos.wiki/wiki/K3s>
    k3s = {
      enable = true;
      role = "server";
    };

    # TODO: tor, i2p, lokinet, freenet, gnunet

    # IPFS
    #- <https://nixos.wiki/wiki/IPFS>
    kubo = {
      enable = true;
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

    zeronet = {
      enable = true;
      #- <https://github.com/NixOS/nixpkgs/pull/173900>
      package = pkgs.zeronet-conservancy; # maintained community fork of zeronet
      port = 7110; # default: 43110
      # fileserverPort = 7111; # default: 12261
      # tor = true; # Only use Tor for Tor network peers
      # torAlways = false; # Use Tor for every connections to hide your IP address (slower)
      # Default data dir: /var/lib/zeronet/
    };

    # https://nixos.wiki/wiki/SSH_public_key_authentication
    openssh = {
      enable = false;
      settings.passwordAuthentication = true; # setting it to false requires public key authentication for better security
      settings.kbdInteractiveAuthentication = false;
      settings.PermitRootLogin = "yes";
    };

    mpd = {
      enable = false; # Music Player Daemon
      startWhenNeeded = true;
    };

    ympd.enable = false; # WebUI for MPD. <http://localhost:6600>
    gvfs.enable = true; # Trash folder support (e.g. in Thunar)

    /*
    deluge = {
      enable = true;
      web.enable = true;
    };
    */

    # TODO: setup USBGuard
    #- <https://usbguard.github.io>
    # services.usbguard.enable = true;

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
      time = 8; # in minutes
      notify = 10; # in seconds
      killtime = 120; # in minutes
      # TODO: Use a better lockscreen tool
      locker = "${pkgs.betterlockscreen}/bin/betterlockscreen --lock blur";
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
