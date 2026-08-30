{ pkgs ? import <nixpkgs> {}
, theme }:

pkgs.mkShell {
  buildInputs = [ pkgs.hugo ];

  shellHook = ''
    mkdir -p themes
    ln -sfnT ${theme} themes/profile
  '';
}
