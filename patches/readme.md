# Applying patches

Patches can be applied to packages in nixpkgs by using the `overrideAttrs` function. This function allows you to modify the attributes of a package, including adding patches. The following example shows how to apply a patch to a package:

```nix
(packageNameHere.overrideAttrs (previousAttrs: {
  patches = previousAttrs.patches ++ [ ./my-patch.patch ];
}))
```

## List of patches

- emacs-no-version-check.patch - [35ccb9d](https://github.com/NixOS/nixpkgs/commit/35ccb9db3f4f0872f05d175cf53d0e1f87ff09ea) breaks nix-doom-emacs install by preventing home-manager from building. This patch undoes this commit.

- cap_sys_nice_begone.patch - By applying this patch, the AMDGPU kernel driver will ignore process privileges and allow any application to create high priority contexts.

- enable-optimization-level-3.patch - Enable level 3 optimization (CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3) for the linux kernel for various architectures.

- remove-expert-dependency-on-processor-select.patch - Remove the expert dependency on processor select menu in the linux kernel. Required to disable other architectures to remove bloat.

- gcc-fuse-ld-mold.patch - Enable support for the mold linker (--fuse-ld=mold) in GCC.
