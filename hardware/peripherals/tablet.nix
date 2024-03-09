# Tablet Configuration
# <https://opentabletdriver.net>
{pkgs, ...}: {
  hardware.opentabletdriver = {
    # For Gaomon S620
    #- Supported Tablets: <https://opentabletdriver.net/Tablets>
    enable = false;
    daemon.enable = true;
    package = pkgs.opentabletdriver;
  };
}
