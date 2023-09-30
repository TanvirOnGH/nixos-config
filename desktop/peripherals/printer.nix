# Printer Configuration
#- <https://nixos.wiki/wiki/Printing>
{pkgs, ...}: {
  services.printing.enable = false;
  services.printing.drivers = [pkgs.pantum-driver];
}
