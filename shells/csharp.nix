let
  pkgs = import <nixpkgs> {};
in with pkgs; mkShell {
  packages = with pkgs; [
    dotnet-sdk_8
    mono5
  ];

  shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    
    alias build="mcs -out:bin/Program.exe *.cs"
    alias run="mkdir -p bin && build && mono bin/Program.exe"
  '';
}
