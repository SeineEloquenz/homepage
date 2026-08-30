{ stdenvNoCC
, hugo
, theme
, ... }:

stdenvNoCC.mkDerivation {
  pname = "website";
  version = "latest";
  src = ./.;
  buildPhase = ''
    rm -rf themes/profile
    mkdir -p themes
    cp -r ${theme} themes/profile
    ${hugo}/bin/hugo
  '';
  installPhase = "cp -r public $out";
}
