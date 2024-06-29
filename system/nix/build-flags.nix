# <https://wiki.nixos.org/wiki/Build_flags>
{lib, ...}: {
  nix.settings.substituters = lib.mkForce [];
  # nix.settings.substitute = false;

  # <https://wiki.nixos.org/wiki/Build_flags#Building_the_whole_system_on_NixOS>
  nixpkgs = {
    hostPlatform.system = "x86_64-linux";

    hostPlatform = {
      gcc = {
        arch = "native";
        tune = "native";
      };
    };
  };
}
