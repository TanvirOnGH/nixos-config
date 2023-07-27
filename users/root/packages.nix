# Root/System Packages Configuration
{pkgs, ...}: {
  /*
  nixpkgs.config.packageOverrides = pkgs: {
    USER = import (builtins.fetchTarball "https://github.com/USER/nixpkgs/archive/experimental.tar.gz") {
      inherit pkgs;
    };
  };
  */

  environment.systemPackages = with pkgs; [
    # USER.hblock # cli: shell script for blocking ads, malware and tracking domains
    gparted # gui: partition manager for gnome
  ];
}
