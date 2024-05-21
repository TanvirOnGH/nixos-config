# Home Manager User's GTK Configuration
# TODO: https://github.com/danth/stylix
{...}: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {pkgs, ...}: {
    gtk = {
      enable = true;

      # preferred: flat-remix-gtk, venta, vimix-gtk-themes, plata-theme,
      #            nordic, equilux-theme, materia-theme
      theme = {
        package = pkgs.equilux-theme;
        name = "Equilux";
      };

      # preferred: bibata-cursors, bibata-extra-cursors
      iconTheme = {
        package = pkgs.tela-icon-theme;
        name = "Tela-black-dark";
      };

      # preferred: bibata-cursors, bibata-extra-cursors
      cursorTheme = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Original-Classic";
        size = 30;
      };

      font = {
        package = pkgs.fira-code;
        name = "Fira Code";
        size = 12;
      };

      gtk2 = {
        extraConfig = "gtk-can-change-accels = 1";
      };

      gtk3 = {
        bookmarks = [
          "file:///home/user"
          "file:///home/user/downloads"
          "file:///home/user/media/pictures/screenshots"
        ];
        extraConfig = {
          gtk-cursor-blink = false;
          gtk-recent-files-limit = 30;
          gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
          gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
          gtk-button-images = 0;
          gtk-menu-images = 1;
          gtk-enable-event-sounds = 1;
          gtk-enable-input-feedback-sounds = 1;
          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintfull";
          gtk-xft-rgba = "rgb";
          gtk-decoration-layout = "appmenu:none";
        };
      };

      gtk4 = {
        extraConfig = {
          gtk-cursor-blink = false;
          gtk-recent-files-limit = 30;
          gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
          gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
          gtk-button-images = 0;
          gtk-menu-images = 1;
          gtk-enable-event-sounds = 1;
          gtk-enable-input-feedback-sounds = 1;
          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintfull";
          gtk-xft-rgba = "rgb";
          gtk-decoration-layout = "appmenu:none";
        };
      };
    };
  };
}
