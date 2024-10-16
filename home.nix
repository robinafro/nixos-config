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
  ];

  programs.home-manager.enable = true;
}

