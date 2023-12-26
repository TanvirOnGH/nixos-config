{
  self,
  inputs,
  config,
  ...
}:
# Flake management of NIXOS system
{
  flake.nixosConfigurations."nixos" = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    modules = [
      self.nixosModules.default

      ./configuration.nix
      # ./hardware-configuration.nix
    ];

    # Needs better management
    specialArgs = {
      unstable = import inputs.nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    };
  };
}
