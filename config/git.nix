{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      email = "elodie@elodiecodes.com";
      name = "Elodie Lander";
    };
  };
}

