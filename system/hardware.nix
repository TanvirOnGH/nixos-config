# Hardware Configuration
{
  lib,
  config,
  ...
}: {
  nixpkgs.hostPlatform = "x86_64-linux";

  hardware = {
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;

    # For Gaomon S620
    #- Supported Tablets: <https://opentabletdriver.net/Tablets>
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
