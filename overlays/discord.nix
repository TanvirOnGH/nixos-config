# <https://nixos.wiki/wiki/Discord>
_: {
  nixpkgs.overlays = let
    # <https://nixos.wiki/wiki/Discord#OpenAsar_.2F_Vencord>
    discord_OpenASAR_Vencord = _self: super: {
      discord = super.discord.override {
        withOpenASAR = true;
        withVencord = true;
      };
    };
  in [discord_OpenASAR_Vencord];
}
