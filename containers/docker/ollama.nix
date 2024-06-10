# <https://github.com/jmorganca/ollama>
# <https://hub.docker.com/r/ollama/ollama>
{...}: {
  virtualisation = {
    /*
    docker = {
      enable = true;

      # Deprecated, use hardware.nvidia-container-toolkit.enable instead
      enableNvidia = true;
    };
    */

    oci-containers = {
      backend = "docker";

      containers = {
        Ollama = {
          image = "ollama/ollama";
          autoStart = true;
          ports = ["127.0.0.1:11434:11434"];
          environment = {};

          mounts = [
            {
              hostPath = "/var/lib/docker/volumes/ollama/_data";
              containerPath = "/root/.ollama";
            }
          ];

          gpuSupport = true;
        };
      };
    };
  };
}
