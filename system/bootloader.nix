# Bootloader Configuration
#- https://nixos.wiki/wiki/Bootloader
# NOTE: Setup <https://github.com/nix-community/lanzaboote>
{...}: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      # https://nixos.wiki/wiki/Bootloader#Limiting_amount_of_entries_with_grub
      configurationLimit = 6;

      # Allow editing the kernel command-line before boot
      # enabled by default for backwards compatibility
      # Recommended to set this to false,
      # as it allows gaining root access by passing
      # init=/bin/sh as a kernel parameter
      editor = false;

      # Set the highest resolution available
      consoleMode = "max";
    };
    efi.canTouchEfiVariables = true;
  };
}
