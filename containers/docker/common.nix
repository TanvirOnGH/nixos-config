# Common configuration for docker containers
# <https://wiki.nixos.org/wiki/Docker>
_: {
  virtualisation = {
    docker = {
      enable = true;

      # Deprecated, use hardware.nvidia-container-toolkit.enable instead
      # enableNvidia = true;
    };

    podman = {
      enable = false;
    };
  };
}
