# User's Settings Configuration
{pkgs, ...}: {
  # Note: Don't forget to set a password with ‘passwd’
  users.users.user = {
    description = "user";
    home = "/home/user";
    isNormalUser = true;
    initialPassword = "user";
    shell = pkgs.fish;

    #- Groups that the user belongs: `groups`
    #- Check member of a particular group `getent group <group>`
    #- Check the available groups `cut -d: -f1 /etc/group`
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "disk"
      "input"
      "network"
      "networkmanager"
      "flatpak"
      "docker"
      "kvm"
      "libvirtd"
      # "boinc"
    ];
  };

  users.extraGroups = {
    vboxusers.members = ["user"];
    docker.members = ["user"];
  };

  environment.shells = [pkgs.fish];
}
