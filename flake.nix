{
  description = "A very basic flake";

  inputs.hugo-profile = {
    url = "github:SeineEloquenz/hugo-profile";
    flake = false;
  };

  outputs = { self, nixpkgs, hugo-profile }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {

    packages."${system}" = {
      website = pkgs.callPackage ./default.nix { theme = hugo-profile; };
      default = self.packages.x86_64-linux.website;
    };

    devShells."${system}".default = pkgs.callPackage ./shell.nix { theme = hugo-profile; };

  };
}
