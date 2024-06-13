# Systemd Configuration
_: {
  # Disable coredump that could be exploited later
  # and also slow down the system when something crash
  # If disabled, core dumps appear in the current directory of the crashing process
  systemd.coredump.enable = false;
}
