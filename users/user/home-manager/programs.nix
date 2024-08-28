# Home Manager User's Programs Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = {pkgs, ...}: {
    programs = {
      firefox = {
        enable = true;
        package = pkgs.firefox-beta;
      };

      chromium = {
        enable = true;
      };

      atuin = {
        enable = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableNushellIntegration = true;
        package = pkgs.atuin;
      };

      thefuck = {
        enable = true;
        enableInstantMode = true; # Experimental as of 20/06/2024

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };

      eza = {
        enable = true;
        icons = true;
        git = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableNushellIntegration = false;
        enableIonIntegration = true;
      };

      yazi = {
        enable = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableNushellIntegration = true;
      };

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
        #- <https://wiki.nixos.org/wiki/Visual_Studio_Code#Use_VS_Code_extensions_without_additional_configuration>
        package = pkgs.vscode.fhs; # gui: vscode with fhs-3.0 environment (chroot)
      };

      direnv = {
        enable = true;
        nix-direnv.enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;
        enableNushellIntegration = true;
        enableFishIntegration = true;
      };

      nushell = {
        enable = true;
      };

      starship = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
        enableIonIntegration = true;

        settings = {
          "$schema" = "https://starship.rs/config-schema.json";

          add_newline = true;
          scan_timeout = 10;

          character = {
            success_symbol = "[:](bold #CB8B8B)[:](bold #6AFF7F)";
            error_symbol = "[:](bold #CB8B8B)[:](bold #DF2929)";
            vimcmd_symbol = "[:](bold #CB8B8B)[:](bold #F46B32)";
            vimcmd_replace_one_symbol = "[:](bold #CB8B8B)[:](bold #C80853)";
            vimcmd_replace_symbol = "[:](bold #CB8B8B)[:](bold #823ADB)";
            vimcmd_visual_symbol = "[:](bold #CB8B8B)[:](bold #4FADB5)";
          };

          directory = {
            style = "bold #D77ABC";
            truncation_length = 5;
            truncate_to_repo = true;
          };

          cmd_duration = {
            format = " took [~$duration]($style) ";
            style = "bold #BC5237";
            show_notifications = true;
          };

          package = {
            disabled = false;
          };
        };
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
