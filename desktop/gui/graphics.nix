# Graphics Configuration
#- <https://wiki.nixos.org/wiki/OpenGL>
# As of 25/06/2024, hardware.opengl has been renamed to hardware.graphics
_: {
  hardware.graphics = {
    enable = true;
    enable32Bit = false; # 32-bit drivers for 32-bit applications (such as Wine)
  };
}
