# Wayland Configuration
{pkgs, ...}: {
  services.xserver = {
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  #  Needed to run X11 applications on Wayland
  #- Even though XWayland has a nearly identical performance to that of X11
  #- In some cases it may degrade performance, especially on NVIDIA cards
  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    # enable Wayland support in QT
    # libsForQt5.qt5.qtwayland
    qt6.qtwayland # library: A cross-platform application framework for C++

    glfw-wayland # library: Multi-platform library for creating OpenGL contexts and managing input, including keyboard, mouse, joystick and time with Wayland support
  ];

  environment.sessionVariables = {
    # Launching electron apps under wayland yields in black screen. Workaround:
    NIXOS_OZONE_WL = "1";

    # Wayland Stuff
    #- Workaround to invisible cursor on Hyprland on nvidia cards
    #- <https://wiki.hyprland.org/FAQ/#me-cursor-no-render>
    WLR_NO_HARDWARE_CURSORS = "1";

    SDL_VIDEODRIVER = "wayland";
    MOZ_ENABLE_WAYLAND = "1";

    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_SESSION_TYPE = "wayland";

    CLUTTER_BACKEND = "wayland";
    WINIT_UNIX_BACKEND = "wayland";
    # End of Wayland Stuff

    GDK_BACKEND = "wayland";
    # GDK_BACKEND = "x11";

    # For compatibility with X11 apps on Wayland
    XDG_CURRENT_DESKTOP = "sway";
    XDG_SESSION_DESKTOP = "sway";

    # Will break SDDM if running X11
    QT_QPA_PLATFORM = "wayland";

    # Required for proprietary applications that do not use the system's implementation of QT
    # QT_QPA_PLATFORM="wayland;xcb";

    #- <https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications>
    #- Required on Wayland even after setting qt.platformTheme:
    #- <https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland>
    QT_QPA_PLATFORMTHEME = "gtk2";
  };
}
