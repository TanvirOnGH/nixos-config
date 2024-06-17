_: {
  nixpkgs.overlays = [
    (final: prev: {
      sudo = prev.sudo.override {withInsults = true;};
    })
  ];
}
