# Rip Out Default Packages
{lib, ...}: {
  # Get rid of default packages for minimalism
  environment.defaultPackages = lib.mkForce [];
}
