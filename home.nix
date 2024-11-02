# home.nix

{ config, pkgs, inputs, ... }:

{
	nixpkgs.config.allowUnfree = true;

  home.username = "robin";
  home.homeDirectory = "/home/robin";
  home.stateVersion = "24.05";

	fonts.fontconfig.enable = true;
  home.packages = [
    inputs.nixvim.packages.${pkgs.system}.default  # Use the default package from your nixvim flake
		(pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })

		pkgs.devenv
		pkgs.prusa-slicer
		pkgs.rpi-imager
		pkgs.gparted
		pkgs.beeper

		pkgs.wl-clipboard
		pkgs.rsync
		pkgs.zip
		pkgs.unzip
		pkgs.tree
		pkgs.jq

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

