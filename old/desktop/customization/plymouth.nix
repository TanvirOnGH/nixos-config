# Plymouth Configuration
{pkgs, ...}: {
  boot.plymouth = {
    enable = false;
    theme = "dna";
    themePackages = [pkgs.adi1090x-plymouth-themes];
  };
}
