# GPU (AMD) Configuration
#- <https://nixos.wiki/wiki/AMD_GPU>
{...}: {
  # amdgpu is the open source driver for AMD GPUs
  services.xserver.videoDrivers = ["amdgpu"];

  # HIP
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.hip}"
  ];

  # OpenCL
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];
}
