let
  pkgs = import <nixpkgs> {};
in with pkgs; mkShell {
  packages = with pkgs; [
    gcc
    glibc
    binutils
    gnumake
    coreutils
    findutils
    diffutils
    gawk
    libtool
    autoconf
    automake
    cmake
    pkg-config
  ];
}
