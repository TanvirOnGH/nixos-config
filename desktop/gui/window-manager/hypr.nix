# Hypr (WM) Configuration
_: {
  services.xserver = {
    windowManager.hypr.enable = true;

    displayManager = {
      startx.enable = false;
      defaultSession = "none+hypr";
    };
  };
}
