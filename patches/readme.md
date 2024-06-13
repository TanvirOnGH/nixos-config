# List of patches

- emacs-no-version-check.patch - [35ccb9d](https://github.com/NixOS/nixpkgs/commit/35ccb9db3f4f0872f05d175cf53d0e1f87ff09ea) breaks nix-doom-emacs install by preventing home-manager from building. This patch undoes this commit.

- cap_sys_nice_begone.patch - By applying this patch, the AMDGPU kernel driver will ignore process privileges and allow any application to create high priority contexts.
