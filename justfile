usage:
    @echo "Usage: make <task>"
    @echo "Tasks:"
    @echo "  lint-check      Lint analysis with statix"
    @echo "  lint            Lint with statix"
    @echo "  format-check    Check formatting with alejandra"
    @echo "  format          Format with alejandra"
    @echo "  deadcode-check  Dead code analysis with deadnix"
    @echo "  deadcode        Remove dead code with deadnix"
    @echo "  fix-all         Run format, deadcode, and lint"
    @echo "  check-all       Run format-check, deadcode-check, and lint-check"
    @echo "  rebuild         Rebuild and switch to new NixOS configuration"
    @echo "  rebuild-upgrade Rebuild + Upgrade and switch to new NixOS configuration"
    @exit 0

fix-all: format deadcode lint
check-all: format-check deadcode-check lint-check

lint-check:
    @echo "Checking anti-pattern issues with statix..."
    statix check

lint:
    @echo "Linting with statix..."
    statix fix

format-check:
    @echo "Checking formatting issues with alejandra..."
    alejandra -c .

format:
    @echo "Formatting with alejandra..."
    alejandra .

deadcode-check:
    @echo "Checking for dead codes with deadnix..."
    deadnix

deadcode:
    @echo "Removing dead codes with deadnix..."
    deadnix -e

confirm-action:
    @read -p "Are you sure you want to delete all files in /etc/nixos and replace them with the current directory's contents? (y/N) " confirm; \
    case $$confirm in \
    [Yy]*) ;; \
    *) echo "Operation aborted by user." 1>&2; exit 1 ;; \
    esac

remove-files:
    @doas rm -rf /etc/nixos/* /etc/nixos/.* || { echo "Failed to remove files in /etc/nixos" 1>&2; exit 1; }

copy-files:
    @doas cp -r . /etc/nixos || { echo "Failed to copy files to /etc/nixos" 1>&2; exit 1; }

rebuild:
    confirm-action
    remove-files
    copy-files
    @doas nixos-rebuild switch || { echo "Failed to rebuild NixOS" 1>&2; exit 1; }

rebuild-upgrade:
    confirm-action
    remove-files
    copy-files
    @doas nixos-rebuild switch --upgrade || { echo "Failed to rebuild NixOS with upgrade" 1>&2; exit 1; }
