let
  pkgs = import <nixpkgs> {};
in with pkgs; mkShell {
  packages = [
    
  ];

  buildInputs = [
    
  ];

  shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    
  '';
}
