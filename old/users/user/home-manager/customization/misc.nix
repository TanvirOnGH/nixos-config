# Home Manager User's Misc Configuration
{...}: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {
    pkgs,
    lib,
    config,
    ...
  }: {
    home = {
      pointerCursor = {
        gtk.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Original-Classic";
        size = 30;

        x11 = {
          enable = true;
          defaultCursor = "Bibata-Original-Classic";
        };
      };
    };

    xdg = {
      enable = true;
      mimeApps.enable = false;

      #- ~/ls.config/user-dirs.dirs
      userDirs = {
        enable = true;
        createDirectories = true;

        download = "${config.home.homeDirectory}/downloads";

        music = "${config.home.homeDirectory}/media/musics";
        pictures = "${config.home.homeDirectory}/media/pictures";
        videos = "${config.home.homeDirectory}/media/videos";

        # Don't need these
        desktop = null;
        documents = null;
        publicShare = null;
        templates = null;

        extraConfig = {
          XDG_APPIMAGE_DIR = "${config.home.homeDirectory}/appimages";
          XDG_MEDIA_DIR = "${config.home.homeDirectory}/media";
          XDG_SCREENSHOT_DIR = "${config.home.homeDirectory}/media/pictures/screenshots";
          XDG_WALLPAPER_DIR = "${config.home.homeDirectory}/media/pictures/wallpapers";
          XDG_TORRENT_DIR = "${config.home.homeDirectory}/downloads/torrents";
        };
      };
    };
  };
}
