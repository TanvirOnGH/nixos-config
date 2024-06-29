# ARGB (OpenRGB) Configuration
# <https://wiki.nixos.org/wiki/OpenRGB>
{pkgs, ...}: {
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
    server.port = 5700;
    package = pkgs.openrgb-with-all-plugins;
  };
}
