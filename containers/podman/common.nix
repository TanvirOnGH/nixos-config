# Common configuration for podman containers
# <https://wiki.nixos.org/wiki/Podman>
_: {
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other
      defaultNetwork.settings.dns_enabled = true;
    };

    docker = {
      enable = false;
    };
  };
}
