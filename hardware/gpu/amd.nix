# GPU (AMD) Configuration
#- <https://wiki.nixos.org/wiki/AMD_GPU>
{pkgs, ...}: {
  # amdgpu is the open source driver for AMD GPUs
  services.xserver.videoDrivers = ["amdgpu"];

  # HIP
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.hip}"
  ];

  # OpenCL
  hardware.graphics.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];
}
