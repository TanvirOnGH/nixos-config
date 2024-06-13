# Administration Configuration
_: {
  security = {
    sudo = {
      enable = false;
      wheelNeedsPassword = true;
      execWheelOnly = true;
      extraConfig = ''
        Defaults env_keep += "SSH_AUTH_SOCK"
      '';
    };

    doas = {
      enable = true;
      extraRules = [
        {
          groups = ["wheel"];
          noPass = false;
          keepEnv = true;
          persist = true;
        }
      ];
    };

    please = {
      enable = false;
      wheelNeedsPassword = true;
    };
  };
}
