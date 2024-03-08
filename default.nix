{ stdenvNoCC
, hugo
, ... }:

stdenvNoCC.mkDerivation {
  pname = "website";
  version = "latest";
  src = ./.;
  buildPhase = "${hugo}/bin/hugo";
  installPhase = "cp -r public $out";
}
