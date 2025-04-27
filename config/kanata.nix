{ pkgs, ... }:

{
  services.kanata = {
    enable = true;
    keyboards = {
      "lemur".config = ''
(defsrc
  esc f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 sys break ins del
  grv 1 2 3 4 5 6 7 8 9 0 min eql bspc home
  tab q w e r t y u i o p [ ] \ pgup
  caps a s d f g h j k l ; ' ent pgdn
  lshft z x c v b n m , . / rshft up end
  lctl kana lmet lalt spc ralt rmet rctl left down rght
)

(deflayer default
  esc f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 sys break ins del
  grv 1 2 3 4 5 6 7 8 9 0 min eql bspc home
  tab q w e r t y u i o p [ ] \ pgup
  lctl a s d f g h j k l ; ' ent pgdn
  lshft z x c v b n m , . / rshft up end
  lctl kana lmet lalt spc ralt rmet rctl left down rght
)
  '';
    };
  };
}
