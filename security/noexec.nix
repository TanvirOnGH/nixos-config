# Makes /nix/store (or symlinks to files in /nix/store) the only binaries that are allowed to be executed
# locks down the package manager so random services can't install software and also
# make it impossible for them to write and run executable files outside of /nix/store
{...}: {
  fileSystems = {
    "/".options = ["noexec"];
    "/etc/nixos".options = ["noexec"];
    "/srv".options = ["noexec"];
    "/var/log".options = ["noexec"];
  };
}
