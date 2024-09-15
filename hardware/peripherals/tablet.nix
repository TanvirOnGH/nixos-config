# Tablet Configuration
# <https://opentabletdriver.net>
{pkgs, ...}: {
  # TODO: configure the plugins declaratively using home-manager
  hardware.opentabletdriver = {
    # For Gaomon S620
    #- Supported Tablets: <https://opentabletdriver.net/Tablets>
    enable = true;
    daemon.enable = true;
    package = pkgs.opentabletdriver;
  };
}
