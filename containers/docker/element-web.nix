# <https://github.com/element-hq/element-web>
_: {
  virtualisation = {
    oci-containers = {
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
