# Audit Tracing Configuration
# Monitor logs with: journalctl -f
_: {
  security = {
    auditd.enable = true;
    audit.enable = true;
    audit.rules = [
      "-a exit,always -F arch=b64 -S execve"
    ];
  };
}
