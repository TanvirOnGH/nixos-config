# Home Manager User's Packages Configuration
{pkgs, ...}: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  /*
  nix-software-center = import (pkgs.fetchFromGitHub {
    owner = "vlinkz";
    repo = "nix-software-center";
    rev = "0.1.1";
    sha256 = "0frigabszyfkphfbsniaa1d546zm8a2gx0cqvk2fr2qfa71kd41n";
  }) {};

  nixos-conf-editor = import (pkgs.fetchFromGitHub {
    owner = "vlinkz";
    repo = "nixos-conf-editor";
    rev = "0.1.1";
    sha256 = "sha256-TeDpfaIRoDg01FIP8JZIS7RsGok/Z24Y3Kf+PuKt6K4=";
  }) {};

  #- Experimental Nix Stuff
  #- <https://github.com/vlinkz/nix-editor>
  #- <https://github.com/snowflakelinux/snow>
  #- <https://github.com/nix-community/nurl>

  #- Gaming Stuff
  #- <https://github.com/fufexan/nix-gaming>
  nix-gaming = import (builtins.fetchTarball "https://github.com/fufexan/nix-gaming/archive/master.tar.gz");

  # jc141x torrent/games
  <https://github.com/jc141x/jc141-bash/blob/master/setup/en/nixos.md>

  #- App Data Locations
  /*
  Data: /var/lib/<pkg>/
  NixOS Applications (.desktops): /run/current-system/sw/share/applications/
  Home-manager Applications (.desktops): ~/.local/state/home-manager/gcroots/current-home/home-path/share/applications/
  */
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  # NUR: <https://nur.nix-community.org>
  /*
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
  */

  home-manager.users.user = {
    pkgs,
    lib,
    config,
    ...
  }: {
    # TODO: Improve descriptions and categorization of packages
    home.packages = with pkgs; [
      # Code editors
      micro # cli: modern and intuitive terminal text editor
      nano # cli: small, user-friendly console text editor
      # kibi # cli: text editor in ≤1024 lines of code, written in rust
      lite-xl # gui: lightweight text editor written in Lua
      vim # cli: The most popular clone of the VI editor
      neovim # cli: vim text editor fork focused on extensibility and agility
      neovide # gui: gui for neovim with additional features (animations, ligatures)
      emacs # cli: the extensible, customizable gnu text editor

      # AI
      # nur.repos.some-pkgs.llama-cpp # cli: Port of Facebook's LLaMA model in C/C++ (master branch)
      # llama-cpp # cli: Port of Facebook's LLaMA model in C/C++

      /*
      mate.pluma # gui: Powerful text editor for the MATE desktop
      ox # cli: independent rust text editor
      lapce # gui: lightning-fast and Powerful Code Editor written in rust
      helix # cli: post-modern text editor
      amp # cli: modern text editor inspired by vim
      */
      # End of Code editors

      # Shell
      # oh-my-posh # cli: A prompt theme engine for any shell
      starship # cli: A minimal, blazing fast, and extremely customizable prompt for any shell
      # inshellisense # cli: IDE style command line auto complete
      # End-of Shell

      # Development
      shellcheck # cli: Shell script analysis tool
      shfmt # cli: A shell parser and formatter
      wakatime # cli: wakatime cli, used for tracking time spent on projects
      direnv # cli: A shell extension that manages your environment
      /*
      shellharden # cli: The corrective bash syntax highlighter
      processing # cli: A language and IDE for electronic arts
      sqlite # cli: A self-contained, serverless, zero-configuration, transactional SQL database engine
      sqliteman # gui: A simple but powerful Sqlite3 GUI database manager
      just # cli: A handy way to save and run project-specific commands
      polypane # gui: Browser with unified devtools targeting responsability and acessibility
      spyder # gui: Scientific python development environment
      racket # gui: A general-purpose multi-paradigm programming language (with Dr. Racket IDE)
      meld # gui: Visual diff and merge tool
      libsForQt5.kompare # gui: diff/patch frontend
      diffuse # gui: Graphical tool for merging and comparing text files
      linkchecker # cli: Check websites for broken links
      shc # cli: Shell Script Compiler
      gitkraken # gui: The downright luxurious and most popular Git client
      git-cola # gui: A sleek and powerful Git GUI
      gitg # gui: GNOME GUI client to view git repositories
      github-desktop # gui: GUI for managing Git and GitHub
      gitoxide # cli: A command-line application for interacting with git repositories
      mercurialFull # cli: A fast, lightweight SCM system for very large distributed projects (full version)
      sqlite-web # web: Web-based SQLite database browser
      sqlitebrowser # gui: DB Browser for SQLite
      */
      # End-of Development

      # Tex
      # lyx # gui: WYSIWYM frontend for LaTeX, DocBook
      # End-of Tex

      # Compositor
      # weston # gui: A lightweight and functional Wayland compositor
      # End-of Compositor

      # Python Development
      # python3Full # cli: Python 3 interpreter (full version)
      # End-of Python Development

      # Kubernetes
      # kubernetes-helm # cli: A package manager for kubernetes
      # End-of Kubernetes

      # JavaScript Development
      #- <https://nixos.wiki/wiki/Node.js>
      /*
      nodejs # cli: Event-driven I/O framework for the V8 JavaScript engine
      yarn # cli: Fast, reliable, and secure dependency management for javascript
      nodePackages.npm # cli: A package manager for JavaScript
      nodenv # cli: Manage multiple NodeJS versions
      node2nix # cli: Generate Nix expressions to build NPM packages
      yarn2nix # cli: Convert packages.json and yarn.lock into a Nix expression that downloads all the dependencies
      */
      # End-of JavaScript Development

      # File Sharing
      /*
      localsend # gui: An open source cross-platform alternative to AirDrop
      libsForQt5.kdeconnect-kde # gui: KDE Connect provides several features to integrate phone and computer
      */
      # End-of File Sharing

      # Gui tools
      # czkawka # gui: A simple, fast and easy to use app to remove unnecessary files from your computer
      # sniffnet # gui: Cross-platform application to monitor your network traffic with ease
      # End-of Gui tools

      # Shells
      # nushellFull # cli: A modern shell written in Rust
      # End-of Shells

      # Cli tools
      argc # cli: A command-line options, arguments and sub-commands parser for bash
      bat # cli: A cat(1) clone with syntax highlighting and Git integration
      # exa # cli: Replacement for 'ls' written in Rust
      eza # cli: A modern, maintained replacement for ls
      grc # cli: A generic text colouriser
      tealdeer # cli: A very fast implementation of tldr in Rust
      cheat # cli: Create and view interactive cheatsheets on the command-line
      broot # cli: An interactive tree view, a fuzzy search, a balanced BFS descent and customizable commands
      ddgr # cli: Search DuckDuckGo from the terminal
      cod # daemon: Tool for generating Bash/Fish/Zsh autocompletions based on `--help` output
      progress # cli: Tool that shows the progress of coreutils programs
      imgcat # cli: It's like cat, but for images
      glow # cli: Render markdown on the CLI, with pizzazz!
      noti # cli: Monitor a process and trigger a notification
      du-dust # cli: du + rust = dust. Like du but more intuitive
      duf # cli: Disk Usage/Free Utility
      sd # cli: Intuitive find & replace CLI (sed alternative)
      mcfly # cli: An upgraded ctrl-r where history results make sense for what you're working on right now
      choose # cli: A human-friendly and fast alternative to cut and (sometimes) awk
      gping # cli: Ping, but with a graph
      procs # cli: A modern replacement for ps written in Rust
      tokei # cli: A program that allows you to count your code, quickly
      runiq # cli: An efficient way to filter duplicate lines from input, à la uniq
      skim # cli: Command-line fuzzy finder written in Rust
      ripgrep # cli: A utility that combines the usability of The Silver Searcher with the raw speed of grep
      watchexec # cli: Executes commands in response to file modifications
      bandwhich # cli: A CLI utility for displaying current network utilization
      kmon # cli: Linux Kernel Manager and Activity Monitor
      grex # cli: A command-line tool for generating regular expressions from user-provided test cases
      ouch # cli: A command-line utility for easily compressing and decompressing files and directories
      rm-improved # cli: Replacement for rm with focus on safety, ergonomics and performance
      ruplacer # cli: Find and replace text in source files
      eva # cli: A calculator REPL, similar to bc
      fclones # cli: Efficient Duplicate File Finder and Remover
      fzf # cli: A command-line fuzzy finder written in Go
      navi # cli: An interactive cheatsheet tool for the command-line and application launchers
      atuin # cli: Replacement for a shell history which records additional commands context with optional encrypted synchronization between machines
      zoxide # cli: A fast cd command that learns your habits
      xplr # cli: A hackable, minimal, fast TUI file explorer
      yq # cli: Command-line YAML/XML/TOML processor - jq wrapper for YAML, XML, TOML documents
      /*
      cointop # cli: The fastest and most interactive terminal based UI application for tracking cryptocurrencies
      fd # cli: A simple, fast and user-friendly alternative to find
      ripgrep-all # cli: Ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, and more
      */
      # End-of Cli tools

      # Show-off tools
      /*
      cmatrix # cli: Simulates the falling characters theme from The Matrix movie
      figlet # cli: Program for making large letters out of ordinary text
      lolcat # cli: A rainbow version of cat
      gay # cli: Colour your text / terminal to be more gay
      cowsay # cli: A program which generates ASCII pictures of a cow with a message
      ponysay # cli: Cowsay reimplemention for ponies
      pokemonsay # cli: Print pokemon in the CLI! An adaptation of the classic cowsay
      cbonsai # cli: Grow bonsai trees in your terminal
      genact # cli: A nonsense activity generator
      */
      # End-of-Show-off tools

      # Plugins
      # oh-my-fish # cli: The Fish Shell Framework
      # End-of Plugins

      # Nix Tools
      nixd # daemon: Nix language server
      alejandra # cli: .nix formatter
      /*
      nixfmt # cli: An opinionated formatter for Nix
      appimage-run # cli: run appimages on nixos
      # <https://github.com/NixOS/nixpkgs/issues/232640>
      steam-run # cli: Run commands in the same FHS environment that is used for Steam
      niv # cli: Easy dependency management for Nix projects
      nixpkgs-review # cli: Review pull-requests on https://github.com/NixOS/nixpkgs
      nix-prefetch # cli: Prefetch any fetcher function call, e.g. package sources
      nix-prefetch-github # cli: Prefetch sources from github
      nix-universal-prefetch # cli: Uses nixpkgs fetchers to figure out hashes
      vulnix # cli: NixOS vulnerability scanner
      nix-index # cli: files database for nixpkgs
      */
      # End-of Nix Tools

      # Documentation
      /*
      zeal # gui: A simple offline API documentation browser
      devdocs-desktop # gui: A full-featured desktop app for DevDocs.io
      gnome.devhelp # gui: API documentation browser for GNOME
      */
      # End-of Documentation

      # Browsers
      tor-browser-bundle-bin # gui: Tor Browser Bundle built by torproject.org
      librewolf # gui: A fork of Firefox, focused on privacy, security and freedom
      mullvad-browser # gui: Privacy-focused browser made in a collaboration between The Tor Project and Mullvad
      floorp # gui: A fork of Firefox, focused on keeping the Open, Private and Sustainable Web alive, built in Japan
      brave # gui: Privacy-oriented browser for Desktop and Laptop computers
      vivaldi # gui: A Browser for our Friends, powerful and personal
      microsoft-edge # gui: The web browser from Microsoft
      opera # gui: Faster, safer and smarter web browser
      /*
      ungoogled-chromium # gui: An open source web browser from Google, with dependencies on Google web services removed
      chromium # gui: An open source web browser from Google
      */
      # End-of Browsers

      # Email
      betterbird # gui: Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will
      thunderbird # gui: A full-featured e-mail client from Mozilla
      electron-mail # gui: electron based protonmail client
      tutanota-desktop # gui: electron based tutanota client
      # claws-mail # gui: The user-friendly, lightweight, and fast email client
      # gnome.geary # gui: Mail client for GNOME 3
      # End-of Email

      # Reverse Engineering
      /*
      ghidra # gui: A software reverse engineering (SRE) suite of tools developed by NSA's Research Directorate in support of the Cybersecurity mission
      radare2 # cli: UNIX-like reverse engineering framework and command-line tools
      iaito # gui: An official graphical interface of radare2
      cutter # gui: Free and Open Source Reverse Engineering Platform powered by rizin
      rizin # cli: UNIX-like reverse engineering framework and command-line toolset
      */
      # End-of Reverse Engineering

      # Debuggers
      /*
      strace # cli: A system call tracer
      valgrind # cli: Debugging and profiling tool suite
      */
      # End-of Debuggers

      # CAD
      /*
      freecad # gui: General purpose Open Source 3D CAD/MCAD/CAx/CAE/PLM modeler
      openscad # gui: 3D parametric model compiler
      */
      # End-of CAD

      # 3D
      /*
      blender # gui: 3D Creation/Animation/Publishing System
      */
      # blender-hip # gui: Blender with the hip support (amd gpus)
      # End-of 3D

      # Virtualization
      /*
      virt-manager # gui: graphical tool for managing virtual machines
      gnome.gnome-boxes # gui: GNOME application to access remote or virtual systems
      distrobox # cli: Wrapper around podman or docker to create and start containers
      lazydocker # tui: A simple terminal UI for both docker and docker-compose
      docker-ls # cli: Tools for browsing and manipulating docker registries
      docker-gc # cli: Docker garbage collection of containers and images
      docker-sync # cli: Run your application at full speed while syncing your code for development
      */
      # End-of Virtualization

      # Crypto
      # monero-gui # gui: Private, secure, untraceable currency
      # End-of Crypto

      # Cleaners
      /*
      bleachbit # gui: Clean Your System and Free Disk Space
      czkawka # gui: A simple, fast and easy to use app to remove unnecessary files from your computer
      */
      # End-of Cleaners

      # Games
      /*
      chessx # gui: Browse and analyse chess games
      scid # gui: Chess database with play and training functionality
      gnuchess # gui: GNU Chess engine
      #- Engines
      stockfish # engine: Strong open source chess engine
      fairymax # engine: A small chess engine supporting fairy pieces
      #- End-of Engines
      # libsForQt5.knights # gui: Chess game for KDE
      */
      # End-of Games

      # Eye-candy
      cava # cli: console-based audio visualizer for alsa
      # End-of Eye-candy

      # Fetchers
      /*
      onefetch # cli: Git repository summary on your terminal
      neofetch # cli: fast, highly customizable system info script
      cpufetch # cli: fancy cpu architecture fetching tool
      ramfetch # cli: A tool which displays memory information
      nur.repos.vanilla.fastfetch # cli: fork of neofetch, but much faster because written in C
      */
      # End of Fetchers

      # Download managers
      wget # cli: Tool for retrieving files using http, https and ftp
      wget2 # cli: Successor of GNU Wget, a file and recursive website downloader.
      curl # cli: A command line tool for transferring files with URL syntax
      motrix # gui: full featured download manager
      uget # gui: download manager using GTK and libcurl
      uget-integrator # plugin: Native messaging host to integrate uGet Download Manager with web browsers
      gallery-dl # cli: Command-line program to download image-galleries and -collections from several image hosting sites
      /*
      aria # cli: lightweight, multi-protocol, multi-source, command-line download utility
      */
      # End-of Download managers

      # Torrent
      qbittorrent # gui: featureful bittorrent client. For plugin: <https://github.com/qbittorrent/search-plugins>
      /*
      tribler # gui: Decentralised P2P filesharing client based on the Bittorrent protocol
      flood # web: A modern Web UI for various torrent clients with multi-user and multi-client support
      jesec-rtorrent # cli: An ncurses client for libtorrent, ideal for use with screen, tmux, or dtach (jesec's fork)
      # transmission # cli: A fast, easy and free BitTorrent client
      transmission-gtk # gui: A fast, easy and free BitTorrent client
      deluge-gtk # gui: A lightweight, Free Software, cross-platform BitTorrent client
      */
      # End-of Torrent

      # Youtube/Spotify Downloader
      yt-dlp # cli: fork of youtube-dl with additional features
      tartube-yt-dlp # gui: gui frontend for youtube-dl and yt-dlp
      /*
      youtube-dl # cli: tool to download videos from youtube and other sites
      ytmdl # cli: cli tool to download music from youtube
      spotdl # cli: spotify downloader
      */
      # End-of Youtube/Spotify Downloader

      # Discord clients
      armcord # gui: lightweight free discord client
      discord # gui: official discord client
      ripcord # gui: proprietary client for discord and slack
      /*
      betterdiscordctl # cli: utility for managing betterdiscord
      cordless # tui: Discord terminal client
      */
      # End-of Discord clients

      # Matrix clients
      element-desktop # gui: popular matrix client
      /*
      fractal # gui: Matrix group messaging app
      fluffychat # gui: Chat with your friends (matrix client)
      cinny-desktop # gui: Yet another matrix client for desktop
      schildichat-desktop # gui: matrix client based on element
      element-desktop-wayland # gui: popular matrix client with wayland support
      */
      # End-of Matrix clients

      # Networking
      /*
      httrack # cli: Easy-to-use offline browser / website mirroring utility
      dnsrecon # cli: DNS Enumeration script
      dig # cli: A DNS lookup utility
      */
      # End-of Networking

      # XMPP/Jabber clients
      /*
      dino # gui: Modern Jabber/XMPP Client using GTK/Vala
      */
      # End-of XMPP/Jabber clients

      # Messengers
      zapzap # gui: WhatsApp desktop application for Linux
      revolt-desktop # gui: An open source user-first chat platform
      /*
      tdesktop # gui: Telegram Desktop messaging app
      session-desktop # gui: Onion routing based messenger
      wire-desktop # gui: A modern, secure messenger for everyone
      signal-desktop # gui: Private, simple, and secure messenger
      threema-desktop # gui: Desktop client for Threema, a privacy-focused end-to-end encrypted mobile messenger
      keybase # cli: The Keybase official command-line utility and service
      keybase-gui # gui: The Keybase official GUI
      zulip # gui: Desktop client for Zulip Chat
      rocketchat-desktop # gui: Official Desktop client for Rocket.Chat
      qtox # gui: Qt Tox client
      slack # gui: Desktop client for Slack
      zulip # gui: Desktop client for Zulip Chat
      gitter # gui: Where developers come to talk
      */
      # End-of Messengers

      # Media
      #- Video Players
      vlc # gui: media player
      mpv # cli: media player
      #- End-of Video Players
      #- Image viewers
      feh # cli: lightweight image viewer
      gthumb # gui: Image browser and viewer for GNOME
      gnome.eog # gui: image viewer app by GNOME
      oculante # gui: A minimalistic crossplatform image viewer written in Rust
      /*
      nsxiv # cli: New Suckless X Image Viewer
      libsForQt5.gwenview # gui: image viewer app by KDE
      napari # gui: A fast, interactive, multi-dimensional image viewer
      digikam # gui: Photo Management Program
      shotwell # gui: Popular photo organizer for the GNOME desktop
      darktable # gui: Virtual lighttable and darkroom for photographers
      */
      #- End-of Image viewers
      #- Image tools
      imagemagickBig # cli: A software suite to create, edit, compose, or convert bitmap images
      #- End-of Image Tools
      #- Audio Players
      lollypop # gui: modern music player for GNOME
      rhythmbox # gui: A music playing application for GNOME
      /*
      libsForQt5.vvave # gui: Multi-platform media player
      */
      #- End-of Audio Players
      #- Controllers
      /*
      jamesdsp # gui: audio effect processor for pipeWire clients
      easyeffects # gui: audio effects for pipewire applications
      */
      pavucontrol # gui: pulseaudio volume control
      #- End-of Controllers
      #- Tools
      ffmpeg_6-full # cli: A complete, cross-platform solution to record, convert and stream audio and video
      /*
      mediainfo # cli: Supplies technical and tag information about a video or audio file
      exiftool # cli: A tool to read, write and edit EXIF meta information
      sox # cli: Sample Rate Converter for audio
      */
      #- End-of Tools
      # End-of Media

      # Entertainment
      spotify # gui: spotify web music player
      /*
      mov-cli # A cli tool to browse and watch movies
      lrby # gui: A browser and wallet for LBRY, the decentralized, user-controlled content marketplace
      nuclear # gui: music streaming app similar to spotify
      popcorntime # gui: An application that streams movies and TV shows from torrents
      */
      # End-of Entertainment

      # Pipewire
      /*
      helvum # gui: a gtk patchbay for pipewire
      qpwgraph # gui: qtcd cd  graph manager for pipewire, similar to QjackCtl
      */
      # End of Pipewire

      # Archivers
      gnome.file-roller # gui: archive manager from gnome desktop
      archiver # gui: rasily create & extract archives, and compress & decompress files of various formats
      zip # cli: Compressor/archiver for creating and modifying zipfiles
      pigz # cli: A parallel implementation of gzip for multi-core machines
      bzip2 # cli: High-quality data compression program
      bzip3 # cli: A better and stronger spiritual successor to BZip2
      xz # cli: A general-purpose data compression software, successor of LZMA
      unzip # cli: An extraction utility for archives compressed in .zip format
      p7zip # cli: 7z archiver (A new p7zip fork with additional codecs and improvements)
      rar # cli: Utility for RAR archives
      libsForQt5.ark # gui: archive manager for KDE
      mate.engrampa # gui: Archive Manager for MATE
      lxqt.lxqt-archiver # gui: Archive tool for the LXQt desktop environment
      xarchiver # gui: GTK frontend to 7z,zip,rar,tar,bzip2, gzip,arj, lha, rpm and deb (open and extract only)
      xar # cli: Extensible Archiver
      mate.engrampa # gui: archive manager from mate desktop
      lxqt.lxqt-archiver # gui: archive manager from lxqt desktop
      # End-of Archivers

      # Readers (pdf, ebook, ...)
      libsForQt5.okular # gui: KDE document viewer
      zathura # gui: A highly customizable and functional PDF viewer
      evince # gui: GNOME's document viewer
      calibre # gui: Comprehensive e-book software
      /*
      foliate # gui: A simple and modern GTK eBook reader
      koreader # gui: An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices
      mupdf # gui: Lightweight PDF, XPS, and E-book viewer and toolkit written in portable C
      cinnamon.xreader # gui: A document viewer capable of displaying multiple and single page document formats like PDF and Postscript
      qpdfview # gui: A tabbed document viewer
      llpp # gui: A MuPDF based PDF pager written in OCaml
      mate.atril # gui: A simple multi-page document viewer for the MATE desktop
      */
      # End-of Readers

      # File managers
      /*
      libsForQt5.dolphin # gui: KDE file manager
      libsForQt5.dolphin-plugins # plugin: plugins for dolphin
      krusader # gui: Norton/Total Commander clone for KDE
      spaceFM # gui: A multi-panel tabbed file manager
      pcmanfm # gui: File manager with GTK interface
      */
      # End-of File managers

      # Terminals
      kitty # gui: gpu accelerated terminal emulator
      # alacritty # gui: gpu accelerated terminal emulator
      # End-of Terminals

      # Menus
      # bemenu # gui: Dynamic menu library and client program inspired by dmenu
      #- X
      # rofi # gui: window switcher, run dialog and dmenu replacement
      # dmenu # gui: generic, highly customizable, and efficient menu for the X
      #- Wayland
      /*
      rofi-wayland # gui: Window switcher, run dialog and dmenu replacement for Wayland
      */
      # End-of Menus

      # Clipboard
      xclip # cli: Tool to access the X clipboard from a console application
      copyq # gui: Clipboard Manager with Advanced Features
      #- <https://wiki.hyprland.org/Useful-Utilities/Clipboard-Managers>
      /*
      parcellite # gui: lightweight GTK clipboard manager
      xsel # cli: Command-line program for getting and setting the contents of the X selection
      */
      # End-of Clipboard

      # Lockscreen
      /*
      betterlockscreen # gui: fast and sweet looking lockscreen with effects
      */
      # End-of Lockscreen

      # Widgets
      /*
      conky # gui: advanced, highly configurable system monitor based on torsmo
      eww # gui: ElKowars wacky widgets
      */
      # End-of Widgets

      # Benchmarking
      /*
      phoronix-test-suite # cli: Open-Source, Automated Benchmarking, Testing, And Reporting
      hyperfine # cli: Fast and user-friendly command-line benchmarking tool written in Rust
      */
      # End-of Benchmarking

      # IRC clients
      /*
      hexchat # gui: A popular and easy to use graphical IRC (chat) client
      pidgin # gui: Multi-protocol instant messaging client
      irssi # cli: Terminal based IRC client
      weechat # cli: A fast, light and extensible chat client
      gnome.polari # gui: IRC chat client designed to integrate with the GNOME desktop
      */
      # End-of IRC clients

      # RSS clients
      # liferea # gui: A GTK-based news feed aggregator
      # End-of RSS clients

      # Fractal Engines
      /*
      mandelbulber # gui: A 3D fractal rendering engine
      */
      # End-of Fractal Engines

      # Recorders
      #- OBS Studio
      /*
      obs-studio # gui: Free and open source software for video recording and live streaming
      obs-studio-plugins.obs-vaapi # plugin: OBS Studio VAAPI support via GStreamer
      obs-studio-plugins.obs-vkcapture # plugin: OBS Linux Vulkan/OpenGL game capture
      obs-studio-plugins.obs-gstreamer # plugin: An OBS Studio source, encoder and video filter plugin to use GStreamer elements/pipelines in OBS Studio
      obs-studio-plugins.input-overlay # plugin: Show keyboard, gamepad and mouse input on stream
      obs-studio-plugins.obs-pipewire-audio-capture # plugin:  Audio device and application capture for OBS Studio using PipeWire
      obs-studio-plugins.obs-nvfbc # plugin: OBS Studio source plugin for NVIDIA FBC API
      gpu-screen-recorder # cli: screen recorder that has minimal impact on system performance by recording a window using the GPU only
      gpu-screen-recorder-gtk # gui: gui for gpu-screen-recorder
      */
      #- End-of OBS Studio
      /*
      peek # gui: Simple animated GIF screen recorder with an easy to use interface
      vhs # cli: A tool for generating terminal GIFs with code
      */
      #- Asciinema
      /*
      asciinema # cli: Terminal session recorder and the best companion of asciinema.org
      asciinema-agg # cli: A command-line tool for generating animated GIF files from asciicast v2 files produced by asciinema terminal recorder
      asciinema-scenario # cli: Create asciinema videos from a text file
      */
      #- End-of Asciinema
      # End-of Recorders

      # Editors
      /*
      #- Audio editors
      audacity # gui: Sound editor with graphical UI
      ardour # gui: Multi-track hard disk recording software
      #- End-of Audio editors
      #- Video editors
      openshot-qt # gui: Free, open-source video editor
      libsForQt5.kdenlive # gui: Video editor for KDE
      lightworks # gui: Professional Non-Linear Video Editor
      flowblade # gui: Multitrack Non-Linear Video Editor
      olive-editor # gui: Professional open-source NLE video editor
      shotcut # gui: A free, open source, cross-platform video editor
      pitivi # gui: Non-Linear video editor utilizing the power of GStreamer
      video-trimmer # gui: Trim videos quickly
      #- End-of Video editors
      */
      #- Image editors
      /*
      krita # gui: A free and open source painting application
      gimp-with-plugins # gui: The GNU Image Manipulation Program (with plugins support)
      gimpPlugins.gap # plugin: The GIMP Animation Package
      gimpPlugins.bimp # plugin: Batch Image Manipulation Plugin for GIMP
      gimpPlugins.fourier # plugin: GIMP plug-in to do the fourier transform
      gimpPlugins.gimplensfun # plugin: GIMP plugin to correct lens distortion using the lensfun library and database
      gimpPlugins.farbfeld # plugin: Gimp plug-in for the farbfeld image format
      #- End-of Image editors
      #- Misc
      inkscape-with-extensions # gui: Vector graphics editor (with extensions support)
      inkscape-extensions.hexmap # extension: An extension for creating hex grids and brick patterns of staggered rectangles in Inkscape
      inkscape-extensions.applytransforms # extension: Inkscape extension which removes all matrix transforms by applying them recursively to shapes
      #- End-of Misc
      */
      # End-of Editors

      # Ricing tools
      # flashfocus # daemon: simple focus animations for tiling window managers
      /*
      #- Wallpaper
      nitrogen # gui: wallpaper browser and setter for X11
      # hyprpaper # gui: A blazing fast wayland wallpaper utility
      # swww # cli: Efficient animated wallpaper daemon for wayland, controlled at runtime
      #- End-of Wallpaper
      lxappearance # gui: program for configuring the theme and fonts of gtk applications
      themechanger # gui: theme changing utility
      wpgtk # gui: template based wallpaper/colorscheme generator and manager
      libsForQt5.qt5ct # gui: qt5 configuration tool
      libsForQt5.qtstyleplugins # plugin: Additional style plugins for Qt5, including BB10, GTK, Cleanlooks, Motif, Plastique
      libsForQt5.qtstyleplugin-kvantum # gui: qt5 theme engine and config tool
      */
      # End-of Ricing tools

      # Tor
      /*
      tor # cli: Anonymizing overlay network
      torsocks # cli: Wrapper to safely torify applications
      nyx # cli: Command-line monitor for Tor
      orjail # cli: Force programs to exclusively use tor network
      onionshare-gui # gui: Securely and anonymously send and receive files
      */
      # End-of Tor

      # Password managers
      keepassxc # gui: Offline password manager with many features
      # End-of Password managers

      # Status bars
      /*
      polybarFull # gui: fast and easy-to-use status bar
      */
      # End-of Status bars

      # Compositor
      picom # daemon: A fork of XCompMgr, a sample compositing manager for X servers
      # End-of Compositor

      # Notification daemon
      /*
      dunst # daemon: lightweight notification daemon. Works with both X and Wayland
      deadd-notification-center # daemon: A haskell-written notification center for users that like a desktop with style
      */
      #- Wayland
      /*
      swaynotificationcenter # daemon: Simple notification daemon with a GUI built for Sway
      mako # daemon: lightweight notification daemon for Wayland
      vizo # daemon: A neat notification daemon for Wayland
      */
      # End-of Notification daemon

      # Font management
      /*
      font-manager # gui: font management application
      gtk2fontsel # gui: gtk 2font selection program
      */
      # End-of Font management

      # Screenshot tools
      flameshot # gui: feature and powerfull screenshot tool
      /*
      scrot # cli: A command-line screen capture utility
      maim # cli: A command-line screenshot utility
      shotgun # cli: Minimal X screenshot utility
      */
      #- Wayland
      /*
      shotman # gui: The uncompromising screenshot GUI for Wayland compositors
      grim # cli: Grab images from a Wayland compositor
      slurp # cli: Select a region in a Wayland compositor
      */
      # End-of Screenshot tools

      # Organizers
      /*
      filebot # The ultimate TV and Movie Renamer
      obsidian # gui: powerful knowledge base that works on top of a local folder of plain text markdown files
      logseq # gui: local-first, non-linear, outliner notebook for organizing and sharing personal knowledge base
      zim # gui: desktop wiki
      freeplane # gui: Mind-mapping software
      joplin-desktop # gui: An open source note taking and to-do application with synchronisation capabilities
      tusk # gui: Refined Evernote desktop app
      dupeguru # gui: Tool to find duplicate files in a system
      standardnotes # gui: A simple and private notes app
      simplenote # gui: The simplest way to keep notes
      zettlr # gui: A markdown editor for writing academic texts and taking notes
      vnote # gui: A pleasant note-taking platform
      rnote # gui: Simple drawing application to create handwritten notes
      trilium-desktop # gui: Hierarchical note taking application with focus on building large personal knowledge bases
      appflowy # gui: An open-source alternative to Notion
      */
      # End-of Organizers

      # Kernel
      /*
      linuxKernel.packages.linux_xanmod_latest.turbostat # cli: Report processor frequency and idle statistics
      linuxKernel.packages.linux_xanmod_latest.zenpower # driver: Linux kernel driver for reading temperature, voltage(SVI2), current(SVI2) and power(SVI2) for AMD Zen family CPUs
      linuxKernel.packages.linux_xanmod_latest.perf # cli: Linux tools to profile with performance counters
      linuxKernel.packages.linux_xanmod_latest.cpupower # cli: Tool to examine and tune power saving features
      */
      # End-of Kernel

      # Educational
      /*
      anki-bin # gui: Spaced repetition flashcard program (Binary version)
      stellarium # gui: Free open-source planetarium
      celestia # gui: Real-time 3D simulation of space
      # kstars # gui: Virtual planetarium astronomy software
      libsForQt5.kalzium # gui: Program that shows you the Periodic Table of Elements

      */
      # End-of Educational

      # Office
      /*
      gnumeric # gui: The GNOME Office Spreadsheet
      libreoffice-fresh # gui: Comprehensive, professional-quality productivity suite, a variant of openoffice.org
      # calligra # gui: A suite of productivity applications
      */
      # End-of Office

      # Software center
      /*
      gnome.gnome-software # gui: software center (supports flathub)
      libsForQt5.discover # gui: Software center for KDE plasma (supports flathub)
      */
      # End-of Software center

      # Anti-virus
      /*
      clamav # gui: Antivirus engine designed for detecting Trojans, viruses, malware and other malicious threats
      */
      # End-of Anti-virus

      # Converters
      /*
      handbrake # gui: A tool for converting video files and ripping DVDs
      rawtherapee # gui: RAW converter and digital photo processing software
      */
      # End-of Converters

      # Calculator
      /*
      qalculate-gtk # gui: The ultimate desktop calculator
      galculator # gui: A GTK 2/3 algebraic and RPN calculator
      speedcrunch # gui: A fast power user calculator
      */
      # End-of Calculator

      # Scientific
      /*
      # mathematica-cuda # gui: Wolfram Mathematica computational software system with CUDA support
      octaveFull # gui: Scientific Programming Language
      scilab-bin # gui: Scientific software package for numerical computations (Matlab lookalike)
      gnuplot # gui: A portable command-line driven graphing utility for many platforms
      */
      # End-of Scientific

      # Security
      /*
      veracrypt # gui: Free Open-Source filesystem on-the-fly encryption
      libsForQt5.kgpg # gui: A KDE based interface for GnuPG, a powerful encryption utility
      gnome-obfuscate # gui: Censor private information
      */
      # End-of Security

      # Mathematics
      /*
      geogebra # gui: Dynamic mathematics software with graphics, algebra and spreadsheets
      */
      # End-of Mathematics

      # SQL
      # mysql-workbench # gui: Visual MySQL database modeling, administration and querying tool
      # End-of SQL

      # Rss reader
      /*
      fluent-reader # gui: Modern desktop RSS reader built with Electron, React, and Fluent UI
      raven-reader # gui: Open source desktop news reader with flexible settings to optimize your experience
      gnome-feeds # gui: An RSS/Atom feed reader for GNOME
      rssguard # gui: Simple RSS/Atom feed reader with online synchronization
      */
      # End-of Rss reader

      # Automation
      /*
      autokey # gui: Desktop automation utility for Linux and X11
      */
      # End-of Automation

      # Color pickers
      #- Wayland
      # hyprpicker # cli: A wlroots-compatible Wayland color picker that does not suck
      #- X
      # gcolor2 # gui: Simple GTK 2 color selector
      /*
      gcolor3 # gui: color selector
      gpick # gui: Advanced color picker written in C++ using GTK+ toolkit
      libsForQt5.kcolorchooser # gui: Color chooser for KDE
      */
      # End-of Color pickers

      # Electronics/Electrical
      /*
      ngspice # gui: The Next Generation Spice (Electronic Circuit Simulator)
      logisim-evolution # gui: Digital logic designer and simulator
      fritzing # gui: An open source prototyping tool for Arduino-based projects
      qucs-s # gui: Spin-off of Qucs that allows custom simulation kernels
      librepcb # gui: A free EDA software to develop printed circuit boards
      geda # gui: Full GPL'd suite of Electronic Design Automation tools
      */
      # End-of Electronics/Electrical

      # VPN
      # protonvpn-gui # gui: Official ProtonVPN Linux app
      # protonvpn-cli # cli: Linux command-line client for ProtonVPN
      # End-of VPN

      # Misc
      /*
      hydrus # gui: Danbooru-like image tagging and searching system for the desktop
      sonic-visualiser # gui: View and analyse contents of music audio files
      qtchan # gui: 4chan browser in qt5
      gnome-podcasts # gui: Listen to your favorite podcasts
      figma-linux # gui: Unofficial Electron-based Figma desktop app for Linux, the collaborative interface design tool
      mousai # gui: Identify any songs in seconds
      d-spy # gui: D-Bus exploration tool
      wike # gui: Wikipedia Reader for the GNOME Desktop
      gnome.gnome-dictionary # gui: Dictionary is the GNOME application to look up definitions
      notion-app-enhanced # gui: Notion Desktop builds with Notion Enhancer
      gallery-dl # cli: Command-line program to download image-galleries and -collections from several image hosting sites
      typst # cli: A new markup-based typesetting system that is powerful and easy to learn
      jitsi # gui: Open Source Video Calls and Chat
      */
      #- End-of Misc

      # Essential tools
      #- https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland#xsettings
      #- https://wiki.hyprland.org/FAQ/#gtk-settings-no-work--whatever
      xsettingsd # cli: Provides settings to X11 applications via the XSETTINGS specification
      xfce.xfce4-taskmanager # Task manager application by XFCE
      nvtop # cli: A (h)top like task monitor for AMD, Intel and NVIDIA GPUs
      nvitop # cli: An interactive NVIDIA-GPU process viewer, the one-stop solution for GPU process management
      i3lock-fancy-rapid # gui: A faster implementation of i3lock-fancy
      # tree # cli: Command to produce a depth indented directory listing
      # gallery-dl # cli: Command-line program to download image-galleries and -collections from several image hosting sites
      smartmontools # cli: Tools for monitoring the health of hard drives
      nvme-cli # cli: NVM-Express user space tooling for Linux
      lm_sensors # cli: Tools for reading hardware sensors
      linux-wifi-hotspot # gui: Feature-rich wifi hotspot creator for Linux which provides both GUI and command-line interface
      #- <https://nixos.wiki/wiki/FAQ/I_installed_a_library_but_my_compiler_is_not_finding_it._Why%3F>
      #- <https://discourse.nixos.org/t/how-to-install-openssl-to-compile-against/1249>
      # openssl # lib+cli: A cryptographic library that implements the SSL and TLS protocols
      #- jq
      # jq # cli: A lightweight and flexible command-line JSON processor
      /*
      jqp # cli: A TUI playground to experiment with jq
      ijq # cli: Interactive wrapper for jq
      */
      #- End-of jq
      /*
      zenith-nvidia # cli: Sort of like top or htop but with zoom-able charts, network, and disk usage, and NVIDIA GPU usage
      filezilla # gui: Graphical FTP, FTPS and SFTP client
      gnome-usage # gui: A nice way to view information about use of system resources, like memory and disk space
      gnome.gnome-disk-utility # gui: A udisks graphical front-end
      hdparm # cli: A tool to get/set ATA/SATA drive parameters under Linux
      btrfs-progs # cli: Utilities for the btrfs filesystem
      compsize # cli: btrfs: Find compression type/ratio on a file or set of files
      exfatprogs # cli: exFAT filesystem userspace utilities
      e2fsprogs # cli: Tools for creating and checking ext2/ext3/ext4 filesystems
      util-linux # cli: A set of system utilities for Linux
      # etcher # gui: Flash OS images to SD cards and USB drives, safely and easily
      glances # cli: Cross-platform curses-based monitoring tool
      gpu-viewer # gui: A front-end to glxinfo, vulkaninfo, clinfo and es2_info
      libva-utils # cli: A collection of utilities and examples for VA-API
      curtail # gui: Simple & useful image compressor
      hamster # gui: Time tracking application
      arandr # gui: A simple visual front end for XRandR
      # ngrok # cli: Allows you to expose a web server running on your local machine to the internet
      glxinfo # cli: Test utilities for OpenGL
      inxi # cli: A full featured CLI system information tool
      treefmt # cli: One CLI to format the code tree
      cpupower-gui # gui: GUI for cpupower, Change the frequency limits of your cpu and its governor
      zenmonitor # gui: Monitoring software for AMD Zen-based CPUs
      doge # cli: wow very terminal doge
      terminal-parrot # cli: Shows colorful, animated party parrot in your terminial
      kmon # cli: Linux Kernel Manager and Activity Monitor
      trashy # cli: A simple, fast, and featureful alternative to rm and trash-cli
      shadowfox # cli: Universal dark theme for Firefox while adhering to the modern design principles set by Mozilla
      baobab # gui: Graphical application to analyse disk usage in any GNOME environment
      wmname # cli: print/set window manager name property of the root window
      ocs-url # cli: open collaboration system for use with the store websites
      traceroute # cli: Tracks the route taken by packets over an IP network
      wgetpaste # cli: Command-line interface to various pastebins
      psensor # gui: hardware temperature monitoring tool
      stress # cli: Simple workload generator for POSIX systems. It imposes a configurable amount of CPU, memory, I/O, and disk stress on the system
      s-tui # cli: Stress-Terminal UI monitoring tool
      libnotify # cli: library that sends desktop notifications to notification daemon
      gping # cli: graphical ping
      cpu-x # gui: Free software that gathers information on CPU, motherboard and more
      dua # cli: A tool to conveniently learn about the disk usage of directories
      vnstat # cli: network statistics utility
      nload # cli: Monitors network traffic and bandwidth usage with ncurses graphs
      alsa-utils # cli: alsa utilities
      hwinfo # cli: Hardware detection tool from openSUSE
      cpuid # cli: Linux tool to dump x86 CPUID information about the CPU
      pciutils # cli: A collection of programs for inspecting and manipulating configuration of PCI devices
      usbutils # cli: Tools for working with USB devices, such as lsusb
      pydf # cli: colourised df(1) clone
      tmux # cli: Terminal multiplexer
      tmate # cli: Instant Terminal Sharing
      krename # gui: A powerful batch renamer for KDE
      eaglemode # gui: a zoomable ui
      mat2 # cli: A handy tool to trash your metadata
      metadata-cleaner # gui: Python GTK application to view and clean metadata in files, using mat2
      # wayland-utils # cli: Wayland utilities (wayland-info)
      # wdisplays # gui: A graphical application for configuring displays in Wayland compositors
      */
      # End-of Uncategorized

      # Remote Desktop
      /*
      teamviewer # gui: proprietary
      rustdesk # gui: free
      anydesk # gui: proprietary
      */
      # End-of Remote Desktop

      # Firewall
      /*
      opensnitch # cli: application firewall
      opensnitch-ui # gui: application firewall ui
      */
      # End-of Firewall

      # Networking
      # ooniprobe-cli # cli: The Open Observatory of Network Interference command line network probe
      # End-of Networking

      # Gaming/Windows
      #- Wine
      /*
      wine-wayland # cli: An Open Source implementation of the Windows API on top of OpenGL and Unix (with experimental Wayland support)
      wine-staging # cli: oss implementation of the windows api on top of x, opengl and unix with staging patches
      winetricks # gui: script to install dll's needed to work around problems in wine
      #bottles # gui: easy-to-use wineprefix manager aka gui for wine
      #- Proton
      protontricks # cli: wrapper for running winetricks commands for proton-enabled games
      protonup-qt # gui: Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris
      # Misc
      lutris # gui: Open Source gaming platform for GNU/Linux
      */
      # End-of Gaming/Windows

      # Experimental Nix Tools
      /*
      nix-software-center # gui: A simple gtk4/libadwaita software center to easily install and manage nix packages
      nixos-conf-editor # gui: A libadwaita/gtk4 app for editing NixOS configurations
      nix-editor # cli: A command line utility for modifying NixOS configuration values
      snow # cli: A commandline wrapper for the Nix package manager
      */
      # End-of Experimental Nix Tools
    ];
  };
}
