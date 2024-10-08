let
  pkgs = import <nixpkgs> {};
in with pkgs; mkShell {
  packages = [
    arduino-cli
    screen
  ];

  shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)

    alias upload="arduino-cli compile -b arduino:avr:uno . && arduino-cli upload -p /dev/ttyUSB0 -b arduino:avr:uno ."
  '';
}
