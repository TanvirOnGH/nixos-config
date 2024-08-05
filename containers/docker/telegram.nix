# <https://hub.docker.com/r/kasmweb/telegram>
_: {
  virtualisation = {
    oci-containers = {
      backend = "docker";

      containers = {
        Telegram = {
          image = "kasmweb/telegram:latest";
          autoStart = true;
          ports = ["127.0.0.1:6901:6901"];

          environment = {
            VNC_PW = "password";
          };

          shmSize = "512m";
        };
      };
    };
  };
}
