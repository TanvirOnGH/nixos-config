# Home Manager User's QT Configuration
{...}: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {...}: {
    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "gtk2";
      # style.package = pkgs.p; # Auto-detected from qt.style.name if possible.
    };
  };
}
