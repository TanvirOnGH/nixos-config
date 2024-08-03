# <https://github.com/amir20/dozzle>
_: {
  virtualisation = {
    oci-containers = {
      backend = "docker";

      containers = {
        dozzle = {
          image = "amir20/dozzle:latest";
          autoStart = true;
          ports = ["127.0.0.1:8888:8080"];
          volumes = ["/var/run/docker.sock:/var/run/docker.sock"];
        };
      };
    };
  };
}
