# Xorg/X11 Configuration
#- <https://nixos.wiki/wiki/Xorg>
{pkgs, ...}: {
  services = {
    libinput = {
      enable = true;
      mouse = {
        disableWhileTyping = true;
        accelProfile = "adaptive";
        naturalScrolling = false;
      };
    };

    xserver = {
      enable = true;
      autorun = true;
      xkb.layout = "us";
      desktopManager.xterm.enable = false;
      excludePackages = [pkgs.xterm];

      displayManager.startx.enable = false;
    };

    displayManager = {
      defaultSession = "none+awesome";
      autoLogin = {
        enable = true;
        user = "user";
      };
    };
  };
}
