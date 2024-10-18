let
  pkgs = import <nixpkgs> {};
  python = pkgs.python312;
  pythonPackages = python.pkgs;
  lib-path = with pkgs; lib.makeLibraryPath [
    libffi
    openssl
    stdenv.cc.cc
  ];
in with pkgs; mkShell {
  packages = [
    pythonPackages.pydantic
    pythonPackages.venvShellHook
		pythonPackages.pip
    uv
  ];

  buildInputs = [
    readline
    libffi
    openssl
    git
    openssh
    rsync
  ];

  shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)
    export "LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${lib-path}"
    export PYTHONPATH=`pwd`/$VENV/${python.sitePackages}/:$PYTHONPATH
  '';
}
