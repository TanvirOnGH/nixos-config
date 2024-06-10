# <https://github.com/element-hq/element-web>
{...}: {
  virtualisation = {
    /*
    docker = {
      enable = true;

      # Deprecated, use hardware.nvidia-container-toolkit.enable instead
      enableNvidia = true;
    };
    */

    podman = {
      enable = false;

      # create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # required for containers under podman-compose to be able to talk to each other
      defaultNetwork.settings.dns_enabled = true;
    };

    oci-containers = {
      # backend = "podman";
      backend = "docker";

      containers = {
        Element-Web = {
          image = "vectorim/element-web:latest";
          autoStart = true;
          ports = ["127.0.0.1:9000:80"];
        };
      };
    };
  };
}
