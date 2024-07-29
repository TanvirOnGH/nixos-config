# <https://wiki.nixos.org/wiki/MPV>
_: {
  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = with self.mpvScripts; [
          uosc # Userscript: Feature-rich minimalist proximity-based UI
          thumbfast # Userscript: High-performance on-the-fly thumbnailer
          seekTo # Userscript: For seeking to a specific position
          webtorrent-mpv-hook # Userscript: Adds a hook that allows mpv to stream torrents
          mpv-cheatsheet # Userscript: For looking up keyboard shortcuts
          quality-menu # Userscript: Allows you to change youtube video quality (ytdl-format) on the fly
          sponsorblock # Userscript: Skip sponsored segments of YouTube videos
          reload # Userscript: Manual & automatic reloading of videos
          autoload # Userscript: Automatically loads playlist entries before and after the currently played file
          autocrop # Userscript: Uses the lavfi cropdetect filter to automatically insert a crop filter with appropriate parameters for the currently playing video
          youtube-upnext # Userscript: Allows you to play 'up next'/recommended youtube videos
          visualizer # Userscript: Various audio visualization
          videoclip # Userscript: Easily create videoclips
        ];
      };
    })
  ];
}
