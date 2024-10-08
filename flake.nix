{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    nixvim.url = "github:robinafro/nixvim";
  };

  outputs = { self, nixpkgs, nixvim }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      modules =
        [
          ({ pkgs, ... }: {
            
            nixpkgs.overlays = [ nixvim.overlays.default ];
          })
          ./configuration.nix
        ];
    };
  };
}
