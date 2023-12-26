{
  flake,
  self,
  inputs,
  ...
}:
# Management of Nix
{
  nix = {
    # package = pkgs.nixUnstable;
    # nixPath = [ "nixpkgs=${flake.inputs.nixpkgs}" ]; # Enables use of `nix-shell -p ...` etc
    # registry.nixpkgs.flake = flake.inputs.nixpkgs; # Make `nix shell` etc use pinned nixpkgs
    settings = {
      max-jobs = "auto";
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      flake-registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}''; # Nullify the registry for purity
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
      randomizedDelaySec = "4h";
    };
    extraOptions = ''
      builders-use-substitutes = true
      min-free = ${toString (512 * 1024 * 1024)}
      max-free = ${toString (2048 * 1024 * 1024)}
    '';
  };
}
