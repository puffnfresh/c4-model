import ./nix {
  haskellNixSrc = import ./haskell.nix;
  nixpkgs = <nixpkgs>;
}
