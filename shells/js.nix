let
  pkgs = import <nixpkgs> {};
in with pkgs; mkShell {
  packages = with pkgs; [
    nodejs
    deno
    pnpm
  ];

  buildInputs = [
    jq
  ];

  shellHook = ''
    SOURCE_DATE_EPOCH=$(date +%s)

    alias oldnpm=npm
    alias npm=pnpm
    alias scripts='jq ".scripts" package.json'

    export PATH="$PWD/node_modules/.bin/:$PATH"
  '';
}
