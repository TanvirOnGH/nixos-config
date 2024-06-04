# Root/System Packages Configuration
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # USER.hblock # cli: shell script for blocking ads, malware and tracking domains
    gparted # gui: partition manager for gnome
  ];
}
