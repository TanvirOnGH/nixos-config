#!/bin/sh

usage() {
    echo "Usage: $0 [--lint [apply]] [--format] [--deadcode [apply]]"
    echo "Options:"
    echo "  --lint          Run statix check (with optional apply to fix issues)"
    echo "  --format        Run alejandra to format the codebase"
    echo "  --deadcode      Run deadnix check (with optional apply to fix issues)"
    exit 1
}

lint_codebase() {
    if [ "$1" == "apply" ]; then
        echo "Running statix fix..."
        statix fix
    else
        echo "Running statix check..."
        statix check
    fi
}

format_codebase() {
    echo "Running alejandra..."
    alejandra .
}

deadcode_check() {
    if [ "$1" == "apply" ]; then
        echo "Running deadnix fix..."
        deadnix -e
    else
        echo "Running deadnix check..."
        deadnix
    fi
}

if [ $# -eq 0 ]; then
    usage
fi

while [[ $# -gt 0 ]]; do
    case $1 in
    --lint)
        LINT=true
        if [ "$2" == "apply" ]; then
            APPLY_LINT=true
            shift
        fi
        shift
        ;;
    --format)
        FORMAT=true
        shift
        ;;
    --deadcode)
        DEADCODE=true
        if [ "$2" == "apply" ]; then
            APPLY_DEADCODE=true
            shift
        fi
        shift
        ;;
    *)
        usage
        ;;
    esac
done

if [ "$LINT" == true ]; then
    if [ "$APPLY_LINT" == true ]; then
        lint_codebase apply
    else
        lint_codebase
    fi
fi

if [ "$FORMAT" == true ]; then
    format_codebase
fi

if [ "$DEADCODE" == true ]; then
    if [ "$APPLY_DEADCODE" == true ]; then
        deadcode_check apply
    else
        deadcode_check
    fi
fi
