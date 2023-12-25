# GPU (Intel) Configuration
#- <https://nixos.wiki/wiki/Intel_Graphics>
{
  pkgs,
  lib,
  config,
  ...
}: {
  boot.initrd.kernelModules = ["i915"];

  environment.variables = {
    VDPAU_DRIVER = lib.mkIf config.hardware.opengl.enable (lib.mkDefault "va_gl");
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
  };

  hardware.opengl = {
    enable = true;
    driSupport = true; # <https://nixos.org/manual/nixos/unstable/index.html#sec-gpu-accel>
    extraPackages = with pkgs; [
      vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
      vaapiVdpau
      intel-ocl
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
    ];
  };
}
