# Awesome (WM) Configuration
# <https://wiki.nixos.org/wiki/Awesome>
{pkgs, ...}: {
  services = {
    xserver = {
      windowManager.awesome = {
        enable = true;
        noArgb = false;

        package = pkgs.awesome.override {
          lua = pkgs.luajit;
        };

        luaModules = with pkgs.luajitPackages; [
          luarocks # A package manager for Lua
          lgi # Lua bindings to GObject-based libraries
        ];
      };
    };
  };
}
