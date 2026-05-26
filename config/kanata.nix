{ pkgs, ... }:

{
  services.kanata = {
    enable = true;
    keyboards = {
      "lemur" = {
        devices = [ "/dev/input/by-path/platform-i8042-serio-0-event-kbd" ];
        config = ''
(defsrc
  esc f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 sys break ins del
  grv 1 2 3 4 5 6 7 8 9 0 min eql bspc home
  tab q w e r t y u i o p [ ] \ pgup
  caps a s d f g h j k l ; ' ent pgdn
  lshft z x c v b n m , . / rshft up end
  lctl kana lmet lalt spc ralt menu rctl left down rght
)

(deflayermap (default)
  caps lctl)
      '';
    };

    "kinesis-freestyle" = {
        devices = [ "/dev/input/by-id/usb-KINESIS_CORPORATION_KB800HM_Kinesis_Freestyle2_for_Mac-event-kbd" ];
        config = ''
(defsrc caps lalt lmet a z x c v)
(defalias
  macro_mod (tap-hold-press 0 20 lalt (layer-while-held macro-bypass))
)
(deflayer default lctl lmet @macro_mod a z x c v)
(deflayer macro-bypass _ _ _ M-a M-z M-x M-c M-v)
        '';
      };
    };
  };
}
