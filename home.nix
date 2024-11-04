# home.nix

{ config, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-27.3.11" ];

  home.username = "robin";
  home.homeDirectory = "/home/robin";
  home.stateVersion = "24.05";

  fonts.fontconfig.enable = true;
  home.packages = [
    inputs.nixvim.packages.${pkgs.system}.default # Use the default package from your nixvim flake
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })

    # Apps
    pkgs.blender
    pkgs.gimp
    pkgs.krita
    pkgs.kdenlive
    pkgs.inkscape
    pkgs.itch
    pkgs.keepassxc
    pkgs.libreoffice-qt6
    pkgs.logseq
    pkgs.rnote
    pkgs.slack
    pkgs.vlc
    pkgs.webcord-vencord
    pkgs.vscodium
    pkgs.obs-studio

    # Misc apps
    pkgs.prusa-slicer
    pkgs.rpi-imager
    pkgs.beeper

    # Utils
    pkgs.wl-clipboard
    pkgs.rsync
    pkgs.zip
    pkgs.unzip
    pkgs.tree
    pkgs.jq
    pkgs.btop
    pkgs.parted

    # Dev
    pkgs.devenv
    pkgs.python312
    pkgs.python312Packages.pydantic
    pkgs.python312Packages.venvShellHook
    pkgs.uv
    pkgs.isort
    pkgs.black
    pkgs.ruff

    pkgs.stylua
    pkgs.nixfmt-classic
    pkgs.prettierd
    pkgs.eslint

    pkgs.deno
    pkgs.pnpm
  ];

  programs.home-manager.enable = true;
}

