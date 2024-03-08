{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {

    packages."${system}" = {
      website = pkgs.callPackage ./default.nix {};
      default = self.packages.x86_64-linux.website;
    };

    devShells."${system}".default = pkgs.callPackage ./shell.nix {};

  };
}
