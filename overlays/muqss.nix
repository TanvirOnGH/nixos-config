# <https://nixos.wiki/wiki/Linux_kernel#Custom_configuration>
{
  pkgs,
  lib,
  ...
}: {
  nixpkgs = {
    overlays = [
      (self: super: {
        linuxZenWMuQSS = pkgs.linuxPackagesFor (pkgs.linux_zen.kernel.override {
          structuredExtraConfig = with lib.kernel; {
            SCHED_MUQSS = yes;
          };
          ignoreConfigErrors = true;
        });
      })
    ];
  };
}
