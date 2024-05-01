# Xorg/X11 Configuration
#- <https://nixos.wiki/wiki/Xorg>
{
  config,
  pkgs,
  ...
}: {
  services = {
    libinput = {
      enable = true;
      mouse = {
        disableWhileTyping = true;
        accelProfile = "adaptive";
        naturalScrolling = false;
      };
    };

    xserver = with pkgs; {
      enable = true;
      autorun = true;
      xkb.layout = "us";
      desktopManager.xterm.enable = false;
      excludePackages = [xterm];
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
