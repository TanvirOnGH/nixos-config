# Lix Configuration
#- https://lix.systems
# <https://lix.systems/add-to-config/>
{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # This includes the Lix NixOS module in your configuration along with the
    # matching version of Lix itself.
    #
    # The sha256 hashes were obtained with the following command in Lix (n.b.
    # this relies on --unpack, which is only in Lix and CppNix > 2.18):
    # nix store prefetch-file --name source --unpack https://git.lix.systems/lix-project/lix/archive/2.90.0-rc1.tar.gz
    #
    # Note that the tag (e.g. v2.90) in the URL here is what determines
    # which version of Lix you'll wind up with.
    (
      let
        module = fetchTarball {
          name = "source";
          url = "https://git.lix.systems/lix-project/nixos-module/archive/2.90.0-rc1.tar.gz";
          sha256 = "sha256-64lB/NO6AQ6z6EDCemPSYZWX/Qc6Rt04cPia5T5v01g=";
        };
        lixSrc = fetchTarball {
          name = "source";
          url = "https://git.lix.systems/lix-project/lix/archive/2.90.0-rc1.tar.gz";
          sha256 = "sha256-WY7BGnu5PnbK4O8cKKv9kvxwzZIGbIQUQLGPHFXitI0=";
        };
        # This is the core of the code you need; it is an exercise to the
        # reader to write the sources in a nicer way, or by using npins or
        # similar pinning tools.
      in
        import "${module}/module.nix" {lix = lixSrc;}
    )
  ];

  nix.package = pkgs.lix;

  nix.settings = {
    extra-trusted-substituters = ["https://cache.lix.systems"];
    extra-trusted-public-keys = ["cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="];
  };
}
