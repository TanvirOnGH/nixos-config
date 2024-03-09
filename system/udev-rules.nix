# Udev Rules Configuration
{...}: {
  services.udev = {
    # I/O Schedulers
    extraRules = ''
      ACTION=="add|change", KERNEL=="nvme0n1", ATTR{queue/scheduler}="kyber"
      ACTION=="add|change", KERNEL=="sda", ATTR{queue/scheduler}="bfq"
      ACTION=="add|change", KERNEL=="sdb", ATTR{queue/scheduler}="mq-deadline"
    '';
  };
}
