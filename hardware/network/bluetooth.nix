# Bluetooth Configuration
#- <https://nixos.wiki/wiki/Bluetooth>
_: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    hsphfpd.enable = false;
  };
}
