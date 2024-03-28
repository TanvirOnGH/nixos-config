# <https://github.com/open-webui/open-webui>
{
  lib,
  config,
  pkgs,
  ...
}: {
  virtualisation = {
    /*
    docker = {
      enable = true;
    };
    */

    oci-containers = {
      backend = "docker";

      containers = {
        OpenWebUI = {
          image = "ghcr.io/open-webui/open-webui:main";
          autoStart = true;
          ports = ["127.0.0.1:3000:8080"];
          extraHosts = ["host.docker.internal:host-gateway"];

          environment = {
            LOG_LEVEL = "info";
            LOG_HTML = "false";
          };

          mounts = [
            {
              hostPath = "/var/lib/docker/volumes/open-webui/_data";
              containerPath = "/app/backend/data";
            }
          ];
        };
      };
    };
  };
}
