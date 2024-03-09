# Nix Garbage Collection Configuration
#- https://nixos.wiki/wiki/Storage_optimization
{...}: {
  # <https://nixos.wiki/wiki/Storage_optimization#Automation>
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # <https://nixos.wiki/wiki/Storage_optimization#Optimising_the_store>
    settings.auto-optimise-store = true;
  };
}
