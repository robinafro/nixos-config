let
  pkgs = import <nixpkgs> {};
in with pkgs; mkShell {
  packages = with pkgs; [
    gcc
    glibc
    binutils
    make
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
