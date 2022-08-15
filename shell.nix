(import ./default.nix).shellFor {
  packages = ps: [
    ps.c4-model
    ps.marketplace-examples
  ];
  tools.cabal = "3.8.1.0";
}
