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
  };
}
