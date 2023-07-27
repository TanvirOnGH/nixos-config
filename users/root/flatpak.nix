# Flatpak Configuration
#- <https://nixos.wiki/wiki/Flatpak>
{...}: {
  /*
  REF: <https://nixos.wiki/wiki/Fonts#Flatpak_applications_can.27t_find_system_fonts>
  Flatpak applications can't find system fonts, themes (gtk, qt, icon, cursor, etc.)?
  Allow flatpak access the WHOLE filesystem:
  All system files in Flatseal or equivalently filesystem=host available to your application, the command for this is:
    flatpak --user override --filesystem=host
  */

  # Flatpak
  services.flatpak.enable = true;
}
