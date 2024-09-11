# Home Manager User's Misc Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {
    pkgs,
    config,
    ...
  }: {
    home = {
      pointerCursor = {
        gtk.enable = true;
        package = pkgs.bibata-cursors;
        # Easily find the exact names using lxappearance
        name = "Bibata-Original-Classic";
        size = 30;

        x11 = {
          enable = true;
          # Easily find the exact names using lxappearance
          defaultCursor = "Bibata-Original-Classic";
        };
      };
    };

    xdg = {
      enable = true;
      configHome = "~/.config";
      cacheHome = "~/.cache";
      dataHome = "~/.local/share";

      mimeApps.enable = true;

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
          XDG_MEDIA_DIR = "${config.home.homeDirectory}/media";
          XDG_SCREENSHOT_DIR = "${config.home.homeDirectory}/media/pictures/screenshots";
          XDG_WALLPAPER_DIR = "${config.home.homeDirectory}/media/pictures/wallpapers";
          XDG_TORRENT_DIR = "${config.home.homeDirectory}/downloads/torrents";
        };
      };
    };

    # Some applications (e.g. Firefox) don't seem to use XSETTINGS to control text rendering
    # Putting these settings in ~/.Xresources seems to work
    xresources.properties = {
      # Font
      # "Xft.dpi" = 100;
      "Xft.antialias" = 1;
      "Xft.hinting" = 1;
      "Xft.autohint" = 0;
      "Xft.hintstyle" = "hintmedium";
      # "Xft.rgba" = "rgb";
    };
  };
}
