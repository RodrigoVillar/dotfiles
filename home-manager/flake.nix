{
  description = "Home Manager configuration of rodrigo";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jj-starship = {
      url = "github:dmmulroy/jj-starship";
    };
  };

  outputs =
    { nixpkgs, home-manager, jj-starship, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ jj-starship.overlays.default ];
      };
    in
    {
      homeConfigurations."rodrigo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          username = "rodrigo";
          homeDirectory = "/Users/rodrigo";
        };
      };

      homeConfigurations."rodrigo.villar" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          username = "rodrigo.villar";
          homeDirectory = "/Users/rodrigo.villar";
        };
      };
    };
}
