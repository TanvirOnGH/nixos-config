# Hyprland (Wayland Compositor) Configuration
{...}: {
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true; # Required for screenshot tools to work

    xwayland = {
      enable = true;
      # <https://wiki.archlinux.org/title/HiDPI>
    };
  };
}
