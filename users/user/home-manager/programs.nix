# Home Manager User's Programs Configuration
{...}: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {pkgs, ...}: {
    programs = {
      firefox = {
        enable = true;
      };
      chromium = {
        enable = false;
      };

      # TODO: Setup NixVim <https://github.com/nix-community/nixvim>

      /*
      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = ["qemu:///system"];
          uris = ["qemu:///system"];
        };
      };
      */

      vscode = {
        enable = true;
        # needed for rust lang server and rust-analyzer extension
        #- <https://nixos.wiki/wiki/Visual_Studio_Code#Use_VS_Code_extensions_without_additional_configuration>
        package = pkgs.vscode.fhs; # gui: vscode with fhs-3.0 environment (chroot)
      };

      gpg.enable = true;
      lazygit.enable = true;
      gitui.enable = true;

      git = {
        enable = true;
        package = pkgs.gitFull;
        lfs.enable = true;
        delta.enable = true;

        userEmail = "tanvir.ahmed.tonoy@proton.me";
        userName = "Tanvir";

        signing = {
          signByDefault = true;
          key = "/home/user/.ssh/id_ed25519.pub";
        };

        diff-so-fancy = {
          enable = false;
          changeHunkIndicators = true;
          markEmptyLines = true;
          stripLeadingSymbols = true;
          useUnicodeRuler = true;
        };

        difftastic = {
          enable = false;
          background = "dark";
          color = "auto";
        };
      };

      gh = {
        enable = true;
        gitCredentialHelper.enable = true;

        settings = {
          git_protocol = "ssh";
          prompt = "enabled";
          editor = "micro";
        };

        extensions = with pkgs; [
          gh-eco # extension: Explore the ecosystem
          gh-cal # extension: GitHub contributions calender terminal viewer
          gh-dash # extension: Display a dashboard with pull requests and issues
          gh-markdown-preview # extension: Preview Markdown looking like on GitHub
          gh-copilot # extension: GitHub Copilot
          gh-actions-cache # extension: Manage GitHub Actions caches
          gh-screensaver # extension: Animated terminal screensavers
          gh-notify # extension: Display GitHub notifications
          gh-poi # extension: Safely clean up your local branches
          gh-s # extension: Search github repositories interactively
          gh-f # extension: GitHub CLI ultimate FZF extension
          # gh-ost : extension: Triggerless online schema migration solution for MySQL
        ];
      };

      gh-dash.enable = true;
    };
  };
}
