# Flox Configuration
#- https://floxdev.com
{...}: {
  # <https://floxdev.com/docs/#install-flox>
  nix.settings = {
    extra-trusted-substituters = ["https://cache.floxdev.com"];
    extra-trusted-public-keys = ["flox-store-public-0:8c/B+kjIaQ+BloCmNkRUKwaVPFWkriSAd0JJvuDu4F0="];
  };
}
