# <https://github.com/medama-io/medama>
_: {
  virtualisation = {
    oci-containers = {
      backend = "docker";

      containers = {
        Medama = {
          image = "ghcr.io/medama-io/medama:latest";
          autoStart = true;
          ports = ["127.0.0.1:8080:8080"];

          mounts = [
            {
              hostPath = "/var/lib/docker/volumes/medama-data/_data";
              containerPath = "/app/data";
            }
          ];
        };
      };
    };
  };
}
