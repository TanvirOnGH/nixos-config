# Plymouth Configuration
{pkgs, ...}: {
  /*
  nixpkgs.config.packageOverrides = pkgs: {
    USER = import (builtins.fetchTarball "https://github.com/USER/nixpkgs/archive/experimental.tar.gz") {
      inherit pkgs;
    };
  };
  */

  boot.plymouth = {
    enable = false;
    theme = "nixos-blur";
    themePackages = [pkgs.USER.nixos-blur-plymouth];
  };
}
