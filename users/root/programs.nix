# Programs Configuration
{pkgs, ...}: {
  programs = {
    partition-manager.enable = true;

    # Plotinus GTK 3 plugin
    plotinus.enable = true;

    # Conflicts `programs.command-not-found.enable` | `programs.nix-index`. Only one among those.
    command-not-found.enable = false; # Doesn't work without channels
    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    xonsh.enable = false;

    # <https://wiki.nixos.org/wiki/Bash>
    bash = {
      completion.enable = true;
      enableLsColors = true;
      blesh.enable = false;
    };

    fish = {
      enable = true;
      useBabelfish = true;

      vendor = {
        config.enable = true;
        completions.enable = true;
        functions.enable = true;
      };
    };

    # <https://wiki.nixos.org/wiki/Zsh>
    zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      syntaxHighlighting.enable = true;

      autosuggestions = {
        enable = true;
        strategy = ["completion"];
      };

      ohMyZsh = {
        enable = true;
        plugins = ["git" "man"];
        theme = "cypher";
      };
    };

    # Necessary
    # Gnome: <https://wiki.nixos.org/wiki/GNOME#Running_GNOME_programs_outside_of_GNOME>
    # KDE/Plasma: <https://wiki.nixos.org/wiki/KDE#GTK_themes_are_not_applied_in_Wayland_applications>
    # PulseAudio: <https://wiki.nixos.org/wiki/PulseAudio#Paprefs_doesn.27t_work_on_KDE>
    # WM/i3: <https://wiki.nixos.org/wiki/I3#DConf>
    dconf.enable = true;

    virt-manager.enable = true;

    # <https://wiki.nixos.org/wiki/Appimage>
    appimage = {
      enable = true;
      binfmt = true;
    };

    #- <https://wiki.nixos.org/wiki/Node.js>
    npm = {
      enable = false;
      npmrc = ''
        prefix = ''${HOME}/.npm
        color = true
      '';
    };

    adb.enable = false;

    # kdeconnect.enable = true;
    htop.enable = true;
    iotop.enable = true;
    iftop.enable = true;
    mtr.enable = true;
    seahorse.enable = true;

    openvpn3.enable = false;

    atop = {
      enable = true;
      atopgpu.enable = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman # plugin: providing automatic management of removable drives and media
        thunar-archive-plugin # plugin: providing file context menus for archives
        thunar-media-tags-plugin # plugin: providing tagging and renaming features for media files
        # thunar-dropbox-plugin # plugin: adds context-menu items for Dropbox to Thunar
        # tumbler # plugin: providing thumbnailing and metadata extraction for various file types
        catfish # gui: Handy file search tool
      ];
    };

    # Required by thunar if xfce is not used as desktop environment
    # preference changes are discarded otherwise
    # <https://wiki.nixos.org/wiki/Thunar#Configuration>
    xfconf.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    # <https://wiki.nixos.org/wiki/Git>
    git = {
      enable = true;
      lfs.enable = true;
    };
  };
}
