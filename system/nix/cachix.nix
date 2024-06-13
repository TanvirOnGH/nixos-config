# Cachix Configuration
#- https://www.cachix.org
#- https://docs.cachix.org/deploy/running-an-agent/nixos
_: {
  services = {
    cachix-agent.enable = false;

    cachix-watch-store = {
      enable = false;
      cacheName = "experimental";
      cachixTokenFile = "/home/user/.config/cachix/cachix.dhall";
    };
  };
}
