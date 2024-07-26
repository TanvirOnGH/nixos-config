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
      # As of 28/06/2024
      # .latest -> stable
      # .stable -> production
      # .production -> (550)
      # .beta -> (555)
      # .vulkan_beta -> (550, but different)
      # dc -> datacenter driver (520)
      package = config.boot.kernelPackages.nvidiaPackages.beta;

      # Required
      modesetting.enable = true;

      # Experimental, and can cause sleep/suspend to fail
      powerManagement.enable = false;

      # Experimental and only works on modern Nvidia GPUs (Turing or newer)
      powerManagement.finegrained = false;
      nvidiaSettings = true; # GUI settings application, accessible via `nvidia-settings`

      # NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver)
      # <https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus>
      # A Look at their new releases
      # <https://us.download.nvidia.com/XFree86/Linux-x86_64/550.54.14/README/kernel_open.html>
      # says "Use of the open kernel modules on GeForce and Workstation GPUs should be considered Beta quality ..."
      # In nixos official wiki it says:
      # "Currently "beta quality", so false is currently the recommended setting."
      # "Nvidia's open-source kernel module, which is beta-quality and x11-only."
      # <https://wiki.nixos.org/wiki/Nvidia#Modifying_NixOS_configuration>
      # 23/7/2024: NVIDIA 560 (560.28.03) Linux Driver Beta Released - Defaults To Open GPU Kernel Modules
      # <https://www.phoronix.com/news/NVIDIA-560.28.03-Beta-Linux>
      # TODO: Investigate the current state of this driver and the practicality of using it
      # open = lib.mkForce true;
      open = true; # for testing

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
