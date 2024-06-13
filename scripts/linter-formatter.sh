#!/bin/sh

usage() {
    echo "Usage: $0 [--lint [apply]] [--format]"
    echo "Options:"
    echo "  --lint          Run statix check (with optional apply to fix issues)"
    echo "  --format        Run alejandra to format the codebase"
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

if [ $# -eq 0 ]; then
    usage
fi

while [[ $# -gt 0 ]]; do
    case $1 in
    --lint)
        LINT=true
        if [ "$2" == "apply" ]; then
            APPLY=true
            shift
        fi
        shift
        ;;
    --format)
        FORMAT=true
        shift
        ;;
    *)
        usage
        ;;
    esac
done

if [ "$LINT" == true ]; then
    if [ "$APPLY" == true ]; then
        lint_codebase apply
    else
        lint_codebase
    fi
fi

if [ "$FORMAT" == true ]; then
    format_codebase
fi
