# Printer Configuration
#- <https://nixos.wiki/wiki/Printing>
{...}: {
  services.printing.enable = false;
  services.printing.drivers = [pkgs.pantum-driver];
}
