# Hotspot Configuration
#- <https://nixos.wiki/wiki/Internet_Connection_Sharing>
#- <https://blog.project-insanity.org/2022/04/14/easily-configure-a-wifi-hotspot-on-nixos>
{...}: {
  services.create_ap = {
    enable = false;

    settings = {
      INTERNET_IFACE = "enp42s0";
      WIFI_IFACE = "wlp41s0";
      SSID = "NixOS";
      # TODO: Setup Ragenix (https://github.com/yaxitech/ragenix)
      PASSPHRASE = "mysecret";
    };
  };
}
