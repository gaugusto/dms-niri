{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    dank-greeter.url = "github:AvengeMedia/dank-greeter";
  };

  outputs = { self, nixpkgs, dank-greeter, ... } @inputs: {
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
        dank-greeter.nixosModules.default
        ./configuration.nix 
      ];
    };
  };
}

