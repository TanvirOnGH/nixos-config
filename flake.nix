{
  description = "Tanvir's NixOS+Home-Manager Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {self, ...}:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./nixos
        ./machines
      ];

      systems = [
        "x86_64-linux"
      ];

      perSystem = {
        system,
        config,
        ...
      }: {
        devShells.default = inputs.nixpkgs.legacyPackages.${system}.mkShell {
          name = "OVERHAULIN";
          nativeBuildInputs = [
            inputs.nixpkgs.legacyPackages.${system}.nil # For linting
            inputs.nixpkgs.legacyPackages.${system}.alejandra # Nix formatter
            inputs.nixpkgs.legacyPackages.${system}.git # Working with the codebase
          ];
        };

        formatter = inputs.nixpkgs.alejandra;
      };
    };
}
