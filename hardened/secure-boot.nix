# Secure Boot Configuration
# <https://wiki.nixos.org/wiki/Secure_Boot>
# TODO: lanzaboote <https://github.com/nix-community/lanzaboote>
{
  lib,
  config,
  ...
}: {
  # Recommended to set this to false,
  # as it allows gaining root access by passing
  # init=/bin/sh as a kernel parameter
  boot.loader.systemd-boot.editor = lib.mkForce false;

  boot.tmp.useTmpfs = lib.mkForce false;

  # /tmp should be treated as volatile storage
  boot.tmp.cleanOnBoot = lib.mkForce (!config.boot.tmp.useTmpfs);
}
