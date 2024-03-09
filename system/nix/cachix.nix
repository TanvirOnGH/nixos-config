# Cachix Configuration
#- https://www.cachix.org
#- https://docs.cachix.org/deploy/running-an-agent/nixos
{...}: {
  services = {
    cachix-agent.enable = true;

    cachix-watch-store = {
      enable = false;
      cacheName = "experimental";
      cachixTokenFile = "/home/user/.config/cachix/cachix.dhall";
    };
  };
}
