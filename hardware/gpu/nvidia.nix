# GPU (Nvidia) Configuration
#- <https://wiki.nixos.org/wiki/Nvidia>
#- <https://wiki.hyprland.org/Nvidia>
{
  pkgs,
  config,
  ...
}: {
  # nvidia is the proprietary driver for Nvidia GPUs
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  boot = {
    kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" "i2c-nvidia_gpu"];
    blacklistedKernelModules = ["nouveau"];
    # kernelParams = ["nvidia-drm.fbdev=1"];
  };

  hardware = {
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.latest;

      # Required
      modesetting.enable = true;

      # Experimental, and can cause sleep/suspend to fail
      powerManagement.enable = false;

      # Experimental and only works on modern Nvidia GPUs (Turing or newer)
      powerManagement.finegrained = false;
      nvidiaSettings = true; # GUI settings application, accessible via `nvidia-settings`

      # NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver)
      open = true;

      # Ensure all GPUs stay awake even during headless mode
      # Fixes a glitch
      nvidiaPersistenced = true;
    };

    # Required for Nvidia support in containers (Docker, Podman, etc.)
    nvidia-container-toolkit = {
      enable = true;
      mount-nvidia-executables = true;
      mount-nvidia-docker-1-directories = true;
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    VDPAU_DRIVER = "va_gl";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
    nvidia-vaapi-driver
  ];
}
