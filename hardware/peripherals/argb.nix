# ARGB (OpenRGB) Configuration
# <https://nixos.wiki/wiki/OpenRGB>
{pkgs, ...}: {
  services.hardware.openrgb = {
    enable = false;
    motherboard = "amd";
    server.port = 5700;
    package = pkgs.openrgb-with-all-plugins;
  };
}
