```
elodie@nixos ~/c/nix (add-firefox)> sudo nixos-rebuild switch --flake /home/elodie/code/nix/#default
warning: Git tree '/home/elodie/code/nix' is dirty
building the system configuration...
warning: Git tree '/home/elodie/code/nix' is dirty
evaluation warning: In order to support declarative extension configuration,
                    extension installation has been moved from
                    programs.firefox.profiles.<profile>.extensions
                    to
                    programs.firefox.profiles.<profile>.extensions.packages
error:
       … while calling the 'head' builtin
         at /nix/store/5ds20jm3x2s4z7wn3581r6lc9ybmh45b-source/lib/attrsets.nix:1534:13:
         1533|           if length values == 1 || pred here (elemAt values 1) (head values) then
         1534|             head values
             |             ^
         1535|           else

       … while evaluating the attribute 'value'
         at /nix/store/5ds20jm3x2s4z7wn3581r6lc9ybmh45b-source/lib/modules.nix:1084:7:
         1083|     // {
         1084|       value = addErrorContext "while evaluating the option `${showOption loc}':" value;
             |       ^
         1085|       inherit (res.defsFinal') highestPrio;

       … while evaluating the option `system.build.toplevel':

       … while evaluating definitions from `/nix/store/5ds20jm3x2s4z7wn3581r6lc9ybmh45b-source/nixos/modules/system/activation/top-level.nix':

       … while evaluating the option `home-manager.users.elodie.home.file':

       … while evaluating definitions from `/nix/store/mbpg6sm7xaahdsxs8g3hc0r2hfgcpchq-source/modules/programs/firefox.nix':

       … while evaluating the option `home-manager.users.elodie.programs.firefox.profiles.elodie.extensions.packages':

       … while evaluating definitions from `/nix/store/bkfh40c42k3c0xwbm71wakj3g648mcn8-source/config/firefox.nix':

       (stack trace truncated; use '--show-trace' to show the full, detailed trace)

       error: function 'anonymous lambda' called without required argument 'fetchurl'
       at /nix/store/anzcgaapqq8iqgvz78jsi4lzbkmyqzlj-source/pkgs/firefox-addons/default.nix:1:1:
            1| {
             | ^
            2|   fetchurl,
```
