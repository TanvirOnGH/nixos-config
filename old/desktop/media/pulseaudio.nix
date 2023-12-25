# PulseAudio Configuration
#- <https://nixos.wiki/wiki/PulseAudio>
{pkgs, ...}: {
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };

  services.pipewire = {
    enable = false;
  };

  # Explicit PulseAudio support in applications
  nixpkgs.config.pulseaudio = true;
}
