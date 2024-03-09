# <https://nixos.wiki/wiki/MPV>
{pkgs, ...}: {
  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = with self.mpvScripts; [
          uosc # Feature-rich minimalist proximity-based UI for MPV player
          thumbfast # High-performance on-the-fly thumbnailer for mpv
          seekTo # Mpv script for seeking to a specific position
          webtorrent-mpv-hook # plugin: Adds a hook that allows mpv to stream torrents
          mpv-cheatsheet # mpv script for looking up keyboard shortcuts
          quality-menu # A userscript for MPV that allows you to change youtube video quality (ytdl-format) on the fly
          sponsorblock # Script for mpv to skip sponsored segments of YouTube videos
          reload # Manual & automatic reloading of videos
          autoload # This script automatically loads playlist entries before and after the currently played file
          autocrop # This script uses the lavfi cropdetect filter to automatically insert a crop filter with appropriate parameters for the currently playing video
        ];
      };
    })
  ];
}
