let
  pkgs = import <nixpkgs> (import (import ./haskell.nix) { }).nixpkgsArgs;

  pkgSet = pkgs.haskell-nix.mkCabalProjectPkgSet {
    plan-pkgs = import ./nix/pkgs.nix;
    pkg-def-extras = [
      (hackage: {
        "cabal-doctest".revision = (((hackage."cabal-doctest")."1.0.8").revisions).default;
        "hsc2hs".revision = (((hackage."hsc2hs")."0.68.7").revisions).default;
        "hsc2hs".flags.in-ghc-tree = false;
      })
    ];
    modules = [];
  };
in
  pkgSet.config.hsPkgs
