# Main configuration file for NixOS
#- /etc/nixos/configuration.nix
# channel: nixos https://nixos.org/channels/nixos-unstable
# N.B. : hardware-configuration.nix is autogenerated upon installation
# References:
#- Packages: <https://search.nixos.org/packages>
#- Options: <https://search.nixos.org/options>
#- Flakes: <https://search.nixos.org/flakes>
#- Nix Language Overview: <https://wiki.nixos.org/wiki/Overview_of_the_Nix_Language>
#- Overview of NixOS: <https://wiki.nixos.org/wiki/Overview_of_the_NixOS_Linux_distribution>
{...}: {
  imports = [
    ./imports.nix
  ];

  # Permission
  nix.settings.trusted-users = ["root" "user"];

  # Do not change
  system.stateVersion = "23.05";
}
