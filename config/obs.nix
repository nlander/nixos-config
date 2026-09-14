{ pkgs, lib, ... }:

let
  streamKey = builtins.getEnv "OWNCAST_STREAM_KEY";
  streamServer = builtins.getEnv "OWNCAST_STREAM_SERVER";
in
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };
  xdg.configFile."obs-studio/service.json".text = lib.mkIf (streamKey != "") ''
    {
      "type": "rtmp_custom",
      "settings": {
        "server": "${streamServer}",
        "key": "#{streamKey}"
      }
    }
  '';
}
