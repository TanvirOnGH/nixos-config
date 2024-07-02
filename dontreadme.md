# About

Things you can do but you shouldn't do on NixOS.

> [!CAUTION]
> Don't tell anyone.

## Configuration with TOML

NixOS Can be Configured with TOML:

```nix
# configuration.nix
imports = [
    (builtins.fromTOML (builtins.readFile ./config.toml))
]
```

```nix
# config.toml
[boot]
loader.systemd-boot.enable = true

[programs.git]
enable = true
lfs.enable = true
```

### Misc

Possible to configure with others e.g. JSON: `builtins.fromJSON (builtins.readFile ./config.json);`. See configs directory.

## Compiling with LTO and PGO

You can add advanced compiler flags to your `stdenv` with a configuration like this:

```nix
self: super: {
  stdenv = super.withCFlags ["-flto" "-funroll-loops" "-O3"] super.stdenv;
}
```

These flags will be applied to everything built with `stdenv`. However, PGO cannot be added to the entire system easily because it requires a different compilation procedure. A version of GCC built with PGO is available in `pkgs.fastStdenv`.

To handle packages that fail to build due to these compiler flags, use overrides to replace the inputs of derivations. For example:

```nix
self: super: {
  stdenv = super.withCFlags ["-flto" "-funroll-loops" "-O3"] super.stdenv;

  coreutils = super.coreutils.override {stdenv = super.stdenv;};
}
```

For PGO, refer to [this example](https://github.com/NixOS/nixpkgs/pull/164646). You can also look at the Firefox derivation to see how to implement LTO.

For LTO in the kernel, see [this example](https://github.com/lovesegfault/nix-config/blob/b53f5f6ccc27f7cf8512dd63d5ce002758d3bbbd/nix/overlays/linux-lto.nix).

### Misconceptions

- LTO (Link Time Optimization) does not affect reproducibility but requires recompilation and consumes more resources, especially if you use FatLTO instead of ThinLTO.
- PGO (Profile-Guided Optimization) can affect reproducibility if the profile differs across builds. PGO should not cause reproducibility issues if you store and reuse the profiles used for optimization.

## Applying GCC Flags Globally

Not all packages in NixOS are built from source; many are unpacked from pre-compiled .deb files. To apply GCC flags globally, refer to `system/nix/build-flags.nix`.

## Compiling All Packages from Source

For instructions on compiling all packages from source, see `system/nix/build-flags.nix`.

## Ccache

Using Ccache system-wide is not possible. However, it might be feasible to specify individual packages that should use the cache, depending on how a derivation is packed. For more information, refer to the unofficial NixOS wiki [here](https://nixos.wiki/wiki/CCache).

## Sccache

To enable sccache to use its cache, you need to disable the [Nix sandbox](https://nixos.org/nixos/options.html#sandbox). The sandbox restricts filesystem and network access, which interferes with sccache functionality.

## Use different version of a package in NixOS

Follow this example ([source](https://bobvanderlinden.me/customizing-packages-in-nix/#use-different-version-of-a-package-in-nixos)):

```nix
{
  services.xserver.windowManager.i3.package = pkgs.i3.overrideAttrs (previousAttrs: {
    name = "i3-next";
    src = pkgs.fetchFromGitHub {
      owner = "i3";
      repo = "i3";
      rev = "90432jkfdkjf92343290842343290dsfiu";
      hash = pkgs.lib.fakeHash;
    };
  });
}
```

## Use local source code for a package

Follow this example ([source](https://bobvanderlinden.me/customizing-packages-in-nix/#use-local-source-code-for-a-package)):

```nix
{
  environment.systemPackages = [pkgs.myfortune];

  nixpkgs.overlays = [
    (final: prev: {
      myfortune = prev.fortune.overrideAttrs (previousAttrs: {
        src = ./fortune-src;
      });
    })
  ];
}
```

## Use a different dependency for a single package

Follow this example ([source](https://bobvanderlinden.me/customizing-packages-in-nix/#use-a-different-dependency-for-a-single-package)):

```nix
{
  nixpkgs.overlays = [
    (final: prev: {
      maven-jdk8 = prev.maven.override {
        jdk = final.jdk8;
      };
    })
  ];
}
```

## Apply a security patch system-wide

Follow this example ([source](https://bobvanderlinden.me/customizing-packages-in-nix/#apply-a-security-patch-system-wide)):

```nix
{
  nixpkgs.overlays = [
    (final: prev: {
      openssl = prev.openssl.overrideAttrs (previousAttrs: {
        patches = previousAttrs.patches ++ [
          (fetchpatch {
            name = "CVE-2021-4044.patch";
            url = "https://git.openssl.org/gitweb/?p=openssl.git;a=patch;h=758754966791c537ea95241438454aa86f91f256";
            hash = pkgs.lib.fakeHash;
          })
        ];
      });
    })
  ];
}
```
