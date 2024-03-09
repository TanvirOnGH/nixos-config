# Xorg/X11 Configuration
#- <https://nixos.wiki/wiki/Xorg>
{
  config,
  pkgs,
  ...
}: {
  services.xserver = with pkgs; {
    enable = true;
    autorun = true;
    xkb.layout = "us";
    desktopManager.xterm.enable = false;
    excludePackages = [xterm];

    libinput = {
      enable = true;
      mouse = {
        disableWhileTyping = true;
        accelProfile = "adaptive";
        naturalScrolling = false;
      };
    };

    displayManager = {
      autoLogin = {
        enable = true;
        user = "user";
      };
    };
  };
}
