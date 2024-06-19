usage:
    @echo "Usage: just <task>"
    @echo "Tasks:"
    @echo "  lint-check      Lint analysis with statix"
    @echo "  lint            Lint with statix"
    @echo "  format          Format with alejandra"
    @echo "  deadcode-check  Dead code analysis with deadnix"
    @echo "  deadcode        Fix dead code with deadnix"
    @exit 0

lint-check:
    @echo "Checking anti-pattern issues with statix..."
    statix check

lint:
    @echo "Linting with statix..."
    statix fix

format:
    @echo "Formatting with alejandra..."
    alejandra .

deadcode-check:
    @echo "Checking for dead codes with deadnix..."
    deadnix

deadcode:
    @echo "Removing dead codes with deadnix..."
    deadnix -e
