{
  description = "Configuration NixOS avec Flakes et gestion Flatpak";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, flake-utils, nix-flatpak, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.git pkgs.helix pkgs.nixfmt ];
        };
      }) // {
        nixosConfigurations.FrameXos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/FrameXos.nix
            ./hardware-configuration.nix
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
      };
}

