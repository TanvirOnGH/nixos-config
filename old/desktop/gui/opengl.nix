# OpenGL Configuration
#- <https://nixos.wiki/wiki/OpenGL>
{...}: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
