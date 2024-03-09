# Internet (Ethernet/WIFI) Configuration
#- <https://nixos.wiki/wiki/Networking>
{...}: {
  networking = {
    useDHCP = false;
    hostName = "nsa";
    # Available: enp42s0 (ethernet) and wlp41s0 (wifi)
    interfaces.enp42s0.useDHCP = true;
    # Issue with DNS resolution (/etc/resolv.conf)
    resolvconf.dnsExtensionMechanism = false;

    networkmanager = {
      enable = true;
      # <https://nixos.wiki/wiki/Wpa_supplicant>
      wifi.backend = "wpa_supplicant";
      wifi.macAddress = "random";
    };

    nameservers = ["1.1.1.1" "8.8.8.8"];
  };
}
