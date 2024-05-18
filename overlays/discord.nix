# <https://nixos.wiki/wiki/Discord>
{...}: {
  nixpkgs.overlays = let
    # <https://nixos.wiki/wiki/Discord#OpenAsar>
    discordOpenASAR = self: super: {
      discord = super.discord.override {
        withOpenASAR = true;
        withVencord = true;
      };
    };
  in [discordOpenASAR];
}
