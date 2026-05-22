{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    customPaneNavigationAndResize = true;
    historyLimit = 50000;
    keyMode = "vi";
    prefix = "C-Space";
    baseIndex = 1;
    extraConfig = ''
# Show indication prefix has been typed
set -g status-right ' #{?client_prefix,#[reverse]prefix#[noreverse] ,}"#{=21:pane_title}" %H:%M %d-%b-%y'

# Sync with external system clipboard (wl-clipboard)
set -s set-clipboard on

# Paste from wl-paste instead of tmux buffer
bind ] run "wl=\$(wl-paste); tx=\$(tmux show-buffer 2>/dev/null); [ \"\$wl\" = \"\$tx\" ] && tmux paste-buffer -p | (echo \"\$wl\" | tmux load-buffer - && tmux paste-buffer -p)"
    '';
  };
}
