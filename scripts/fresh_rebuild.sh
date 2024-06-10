#!/bin/sh

set -e

upgrade=false

error_exit() {
    echo "$1" 1>&2
    exit 1
}

confirm_action() {
    read -p "Are you sure you want to delete all files in /etc/nixos and replace them with the current directory's contents? (y/N) " confirm
    case $confirm in
    [Yy]*) ;;
    *) error_exit "Operation aborted by user." ;;
    esac
}

remove_files() {
    doas rm -rf /etc/nixos/* /etc/nixos/.* || error_exit "Failed to remove files in /etc/nixos"
}

copy_files() {
    doas cp -r . /etc/nixos || error_exit "Failed to copy files to /etc/nixos"
}

rebuild_nixos() {
    if [ "$upgrade" = true ]; then
        doas nixos-rebuild switch --upgrade || error_exit "Failed to rebuild NixOS with upgrade"
    else
        doas nixos-rebuild switch || error_exit "Failed to rebuild NixOS"
    fi
}

while [ "$1" != "" ]; do
    case $1 in
    --upgrade) upgrade=true ;;
    *) error_exit "Invalid option: $1" ;;
    esac
    shift
done

main() {
    confirm_action
    remove_files
    copy_files
    rebuild_nixos
}

main
