import ./nix {
  nixpkgs = <nixpkgs>;
  haskellNixSrc = import ./haskell.nix;
}
