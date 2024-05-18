# Programs Configuration
{pkgs, ...}: {
  programs = {
    thefuck.enable = true;
    partition-manager.enable = true;

    # Plotinus GTK 3 plugin
    plotinus.enable = true;

    # Conflicts `programs.command-not-found.enable` | `programs.nix-index`. Only one among those.
    command-not-found.enable = false;
    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    xonsh.enable = false;

    # <https://nixos.wiki/wiki/Bash>
    bash = {
      enableCompletion = true;
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

    # <https://nixos.wiki/wiki/Zsh>
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
    # Gnome: <https://nixos.wiki/wiki/GNOME#Running_GNOME_programs_outside_of_GNOME>
    # KDE/Plasma: <https://nixos.wiki/wiki/KDE#GTK_themes_are_not_applied_in_Wayland_applications>
    # PulseAudio: <https://nixos.wiki/wiki/PulseAudio#Paprefs_doesn.27t_work_on_KDE>
    # WM/i3: <https://nixos.wiki/wiki/I3#DConf>
    dconf.enable = true;

    virt-manager.enable = true;

    #- <https://nixos.wiki/wiki/Node.js>
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
      enable = false;
      atopgpu.enable = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman # plugin: providing automatic management of removable drives and media
        thunar-archive-plugin # plugin: providing file context menus for archives
        thunar-media-tags-plugin # plugin: providing tagging and renaming features for media files
        thunar-dropbox-plugin # plugin: adds context-menu items for Dropbox to Thunar
        tumbler # plugin: providing thumbnailing and metadata extraction for various file types
        catfish # gui: Handy file search tool
      ];
    };

    # Required if xfce is not used as desktop environment
    # preference changes are discarded otherwise
    # <https://nixos.wiki/wiki/Thunar#Configuration>
    xfconf.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    # <https://nixos.wiki/wiki/Git>
    git = {
      enable = true;
      lfs.enable = true;
    };
  };
}
