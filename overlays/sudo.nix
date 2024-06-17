_: {
  nixpkgs.overlays = [
    (prev: {
      sudo = prev.sudo.override {withInsults = true;};
    })
  ];
}
