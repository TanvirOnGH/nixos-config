# Hypr (WM) Configuration
{pkgs, ...}: {
  services.xserver = {
    windowManager.awesome = {
      enable = true;
      noArgb = false;
      luaModules = with pkgs.luajitPackages; [
        luarocks # A package manager for Lua
      ];
    };

    displayManager = {
      startx.enable = false;
      defaultSession = "none+awesome";
    };
  };
}
