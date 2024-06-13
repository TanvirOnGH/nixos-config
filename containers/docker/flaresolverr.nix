# <https://github.com/FlareSolverr/FlareSolverr>
_: {
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
        FlareSolverr = {
          image = "ghcr.io/flaresolverr/flaresolverr:latest";
          autoStart = true;
          ports = ["127.0.0.1:8191:8191"];

          environment = {
            LOG_LEVEL = "info";
            LOG_HTML = "false";
            CAPTCHA_SOLVER = "hcaptcha-solver";
            TZ = "Asia/Dhaka";
          };
        };
      };
    };
  };
}
