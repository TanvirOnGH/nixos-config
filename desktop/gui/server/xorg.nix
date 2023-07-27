# Xorg/X11 Configuration
#- <https://nixos.wiki/wiki/Xorg>
{
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    autorun = true;
    layout = "us";
    desktopManager.xterm.enable = false;

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
