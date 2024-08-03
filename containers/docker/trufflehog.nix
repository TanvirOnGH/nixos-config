# <https://github.com/trufflesecurity/trufflehog>
# <https://hub.docker.com/r/trufflesecurity/trufflehog>
_: {
  virtualisation = {
    oci-containers = {
      backend = "docker";

      containers = {
        trufflehog = {
          image = "ghcr.io/trufflesecurity/trufflehog:latest";
          # image = "trufflesecurity/trufflehog:latest";
        };
      };
    };
  };
}
