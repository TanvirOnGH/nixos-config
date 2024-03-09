# Bootloader Configuration
#- https://nixos.wiki/wiki/Bootloader
# NOTE: Setup <https://github.com/nix-community/lanzaboote>
{...}: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      # https://nixos.wiki/wiki/Bootloader#Limiting_amount_of_entries_with_grub
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };
}
