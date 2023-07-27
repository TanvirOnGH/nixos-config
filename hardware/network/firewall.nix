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
        allowedTCPPorts = [8384 22000];
        allowedUDPPorts = [22000 21027];

        allowedTCPPortRanges = [
          # GS-/KDE-Connect
          {
            from = 1714;
            to = 1764;
          }
        ];

        allowedUDPPortRanges = [
          # GS-/KDE-Connect
          {
            from = 1714;
            to = 1764;
          }
        ];
      };
    };
  };
}
