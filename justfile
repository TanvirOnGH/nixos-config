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
