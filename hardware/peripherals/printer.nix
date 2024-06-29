# Printer Configuration
#- <https://wiki.nixos.org/wiki/Printing>
{pkgs, ...}: {
  services.printing.enable = false;
  services.printing.drivers = [pkgs.pantum-driver];
}
