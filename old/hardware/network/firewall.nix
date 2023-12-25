# Firewall Configuration
#- <https://nixos.wiki/wiki/Firewall>
{...}: {
  services.opensnitch.enable = false;

  networking.firewall = {
    enable = false;
    allowPing = true;
    interfaces = {
      "enp42s0" = {
        # allowedTCPPorts = [80 443];
        # Syncthing ports
        # 6433 is equired by k3s so that pod can reach the API server (running on port 6443 by default)
        allowedTCPPorts = [6443 8384 22000];
        allowedUDPPorts = [22000 21027];

        allowedTCPPortRanges = [
          # GS-/KDE-Connect
          {
            from = 1714;
            to = 1764;
          }
        ];

        allowedUDPPortRanges = [
          # {GS/KDE}-Connect
          {
            from = 1714;
            to = 1764;
          }
        ];
      };
    };
  };
}
