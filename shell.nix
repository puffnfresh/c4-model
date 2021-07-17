(import ./default.nix).shellFor {
  packages = ps: [
    ps.c4-model
    ps.marketplace-examples
  ];
  tools.cabal = "3.4.0.0";
}
