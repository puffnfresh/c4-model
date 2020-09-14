{
  pkgs = hackage:
    {
      packages = {
        "warp".revision = (((hackage."warp")."3.3.13").revisions).default;
        "warp".flags.allow-sendfilefd = true;
        "warp".flags.network-bytestring = false;
        "warp".flags.warp-debug = false;
        "cookie".revision = (((hackage."cookie")."0.4.5").revisions).default;
        "void".revision = (((hackage."void")."0.7.3").revisions).default;
        "semigroupoids".revision = (((hackage."semigroupoids")."5.3.4").revisions).default;
        "byteorder".revision = (((hackage."byteorder")."1.0.4").revisions).default;
        "free".revision = (((hackage."free")."5.1.3").revisions).default;
        "tf-random".revision = (((hackage."tf-random")."0.5").revisions).default;
        "exceptions".revision = (((hackage."exceptions")."0.10.4").revisions).default;
        "MissingH".revision = (((hackage."MissingH")."1.4.3.0").revisions).default;
        "binary".revision = (((hackage."binary")."0.8.8.0").revisions).default;
        "hslogger".revision = (((hackage."hslogger")."1.3.1.0").revisions).default;
        "ghc-prim".revision = (((hackage."ghc-prim")."0.6.1").revisions).default;
        "xml-types".revision = (((hackage."xml-types")."0.3.8").revisions).default;
        "utf8-string".revision = (((hackage."utf8-string")."1.0.1.1").revisions).default;
        "old-time".revision = (((hackage."old-time")."1.1.0.3").revisions).default;
        "bifunctors".revision = (((hackage."bifunctors")."5.5.7").revisions).default;
        "fail".revision = (((hackage."fail")."4.9.0.0").revisions).default;
        "split".revision = (((hackage."split")."0.2.3.4").revisions).default;
        "stm".revision = (((hackage."stm")."2.5.0.0").revisions).default;
        "unix-time".revision = (((hackage."unix-time")."0.4.7").revisions).default;
        "http2".revision = (((hackage."http2")."2.0.5").revisions).default;
        "http2".flags.devel = false;
        "base-compat-batteries".revision = (((hackage."base-compat-batteries")."0.11.1").revisions).default;
        "appar".revision = (((hackage."appar")."0.1.8").revisions).default;
        "hourglass".revision = (((hackage."hourglass")."0.2.12").revisions).default;
        "case-insensitive".revision = (((hackage."case-insensitive")."1.2.1.0").revisions).default;
        "network-byte-order".revision = (((hackage."network-byte-order")."0.1.5").revisions).default;
        "xml-conduit".revision = (((hackage."xml-conduit")."1.8.0.1").revisions).default;
        "unix".revision = (((hackage."unix")."2.7.2.2").revisions).default;
        "mtl".revision = (((hackage."mtl")."2.2.2").revisions).default;
        "network-uri".revision = (((hackage."network-uri")."2.6.3.0").revisions).default;
        "asn1-parse".revision = (((hackage."asn1-parse")."0.9.5").revisions).default;
        "regex-base".revision = (((hackage."regex-base")."0.94.0.0").revisions).default;
        "zlib".revision = (((hackage."zlib")."0.6.2.1").revisions).default;
        "rts".revision = (((hackage."rts")."1.0").revisions).default;
        "easy-file".revision = (((hackage."easy-file")."0.2.2").revisions).default;
        "regex-posix".revision = (((hackage."regex-posix")."0.96.0.0").revisions).default;
        "cryptonite".revision = (((hackage."cryptonite")."0.27").revisions).default;
        "cryptonite".flags.support_sse = false;
        "cryptonite".flags.use_target_attributes = true;
        "cryptonite".flags.integer-gmp = true;
        "cryptonite".flags.support_rdrand = true;
        "cryptonite".flags.support_aesni = true;
        "cryptonite".flags.support_deepseq = true;
        "cryptonite".flags.support_pclmuldq = false;
        "cryptonite".flags.check_alignment = false;
        "cryptonite".flags.old_toolchain_inliner = false;
        "clock".revision = (((hackage."clock")."0.8").revisions).default;
        "clock".flags.llvm = false;
        "adjunctions".revision = (((hackage."adjunctions")."4.4").revisions).default;
        "invariant".revision = (((hackage."invariant")."0.5.3").revisions).default;
        "pem".revision = (((hackage."pem")."0.2.4").revisions).default;
        "distributive".revision = (((hackage."distributive")."0.6.2").revisions).default;
        "asn1-encoding".revision = (((hackage."asn1-encoding")."0.9.6").revisions).default;
        "QuickCheck".revision = (((hackage."QuickCheck")."2.14.1").revisions).default;
        "QuickCheck".flags.templatehaskell = true;
        "QuickCheck".flags.old-random = true;
        "scientific".revision = (((hackage."scientific")."0.3.6.2").revisions).default;
        "time-manager".revision = (((hackage."time-manager")."0.0.0").revisions).default;
        "hspec-discover".revision = (((hackage."hspec-discover")."2.7.1").revisions).default;
        "parallel".revision = (((hackage."parallel")."3.2.2.0").revisions).default;
        "deepseq".revision = (((hackage."deepseq")."1.4.4.0").revisions).default;
        "css-text".revision = (((hackage."css-text")."0.1.3.0").revisions).default;
        "random".revision = (((hackage."random")."1.1").revisions).default;
        "uuid-types".revision = (((hackage."uuid-types")."1.0.3").revisions).default;
        "tagsoup".revision = (((hackage."tagsoup")."0.14.8").revisions).default;
        "network".revision = (((hackage."network")."3.1.1.1").revisions).default;
        "word8".revision = (((hackage."word8")."0.1.3").revisions).default;
        "splitmix".revision = (((hackage."splitmix")."0.1").revisions).default;
        "splitmix".flags.optimised-mixer = false;
        "async".revision = (((hackage."async")."2.2.2").revisions).default;
        "dlist".revision = (((hackage."dlist")."0.8.0.8").revisions).default;
        "conduit".revision = (((hackage."conduit")."1.3.2").revisions).default;
        "semigroups".revision = (((hackage."semigroups")."0.19.1").revisions).default;
        "data-default".revision = (((hackage."data-default")."0.7.1.1").revisions).default;
        "HUnit".revision = (((hackage."HUnit")."1.6.0.0").revisions).default;
        "data-default-instances-old-locale".revision = (((hackage."data-default-instances-old-locale")."0.0.1").revisions).default;
        "parsec".revision = (((hackage."parsec")."3.1.14.0").revisions).default;
        "hsc2hs".revision = (((hackage."hsc2hs")."0.68.7").revisions).default;
        "hsc2hs".flags.in-ghc-tree = false;
        "directory".revision = (((hackage."directory")."1.3.6.0").revisions).default;
        "transformers-compat".revision = (((hackage."transformers-compat")."0.6.5").revisions).default;
        "template-haskell".revision = (((hackage."template-haskell")."2.16.0.0").revisions).default;
        "hspec-expectations".revision = (((hackage."hspec-expectations")."0.8.2").revisions).default;
        "mono-traversable".revision = (((hackage."mono-traversable")."1.0.15.1").revisions).default;
        "psqueues".revision = (((hackage."psqueues")."0.2.7.2").revisions).default;
        "vector".revision = (((hackage."vector")."0.12.1.2").revisions).default;
        "call-stack".revision = (((hackage."call-stack")."0.2.0").revisions).default;
        "primitive".revision = (((hackage."primitive")."0.7.1.0").revisions).default;
        "profunctors".revision = (((hackage."profunctors")."5.5.2").revisions).default;
        "blaze-builder".revision = (((hackage."blaze-builder")."0.4.1.0").revisions).default;
        "base-compat".revision = (((hackage."base-compat")."0.11.1").revisions).default;
        "regex-compat".revision = (((hackage."regex-compat")."0.95.2.0").revisions).default;
        "time-compat".revision = (((hackage."time-compat")."1.9.3").revisions).default;
        "ansi-terminal".revision = (((hackage."ansi-terminal")."0.10.3").revisions).default;
        "ansi-terminal".flags.example = false;
        "tagged".revision = (((hackage."tagged")."0.8.6").revisions).default;
        "x509".revision = (((hackage."x509")."1.7.5").revisions).default;
        "lens".revision = (((hackage."lens")."4.19.2").revisions).default;
        "unliftio-core".revision = (((hackage."unliftio-core")."0.2.0.1").revisions).default;
        "containers".revision = (((hackage."containers")."0.6.2.1").revisions).default;
        "integer-logarithms".revision = (((hackage."integer-logarithms")."1.0.3").revisions).default;
        "reflection".revision = (((hackage."reflection")."2.1.6").revisions).default;
        "these".revision = (((hackage."these")."1.1.1.1").revisions).default;
        "streaming-commons".revision = (((hackage."streaming-commons")."0.2.2.1").revisions).default;
        "bytestring".revision = (((hackage."bytestring")."0.10.10.0").revisions).default;
        "markdown".revision = (((hackage."markdown")."0.1.17.4").revisions).default;
        "wai".revision = (((hackage."wai")."3.2.2.1").revisions).default;
        "basement".revision = (((hackage."basement")."0.0.11").revisions).default;
        "setenv".revision = (((hackage."setenv")."0.1.1.3").revisions).default;
        "either".revision = (((hackage."either")."5.0.1.1").revisions).default;
        "old-locale".revision = (((hackage."old-locale")."1.0.0.7").revisions).default;
        "StateVar".revision = (((hackage."StateVar")."1.2").revisions).default;
        "typed-process".revision = (((hackage."typed-process")."0.2.6.0").revisions).default;
        "vault".revision = (((hackage."vault")."0.3.1.4").revisions).default;
        "vault".flags.useghc = true;
        "contravariant".revision = (((hackage."contravariant")."1.5.2").revisions).default;
        "xss-sanitize".revision = (((hackage."xss-sanitize")."0.3.6").revisions).default;
        "data-default-instances-dlist".revision = (((hackage."data-default-instances-dlist")."0.0.1").revisions).default;
        "blaze-markup".revision = (((hackage."blaze-markup")."0.8.2.7").revisions).default;
        "text".revision = (((hackage."text")."1.2.3.2").revisions).default;
        "Cabal".revision = (((hackage."Cabal")."3.2.0.0").revisions).default;
        "assoc".revision = (((hackage."assoc")."1.0.1").revisions).default;
        "unordered-containers".revision = (((hackage."unordered-containers")."0.2.11.0").revisions).default;
        "base64-bytestring".revision = (((hackage."base64-bytestring")."1.1.0.0").revisions).default;
        "base".revision = (((hackage."base")."4.14.0.0").revisions).default;
        "comonad".revision = (((hackage."comonad")."5.0.6").revisions).default;
        "hspec".revision = (((hackage."hspec")."2.7.1").revisions).default;
        "time".revision = (((hackage."time")."1.9.3").revisions).default;
        "data-default-class".revision = (((hackage."data-default-class")."0.1.2.0").revisions).default;
        "mustache".revision = (((hackage."mustache")."2.3.1").revisions).default;
        "vector-algorithms".revision = (((hackage."vector-algorithms")."0.8.0.3").revisions).default;
        "iproute".revision = (((hackage."iproute")."1.7.9").revisions).default;
        "transformers".revision = (((hackage."transformers")."0.5.6.2").revisions).default;
        "hashable".revision = (((hackage."hashable")."1.3.0.0").revisions).default;
        "nats".revision = (((hackage."nats")."1.1.2").revisions).default;
        "nats".flags.binary = true;
        "nats".flags.hashable = true;
        "nats".flags.template-haskell = true;
        "quickcheck-io".revision = (((hackage."quickcheck-io")."0.2.0").revisions).default;
        "wai-extra".revision = (((hackage."wai-extra")."3.0.29.2").revisions).default;
        "wai-extra".flags.build-example = false;
        "data-default-instances-containers".revision = (((hackage."data-default-instances-containers")."0.0.1").revisions).default;
        "attoparsec".revision = (((hackage."attoparsec")."0.13.2.4").revisions).default;
        "blaze-html".revision = (((hackage."blaze-html")."0.9.1.2").revisions).default;
        "colour".revision = (((hackage."colour")."2.3.5").revisions).default;
        "transformers-base".revision = (((hackage."transformers-base")."0.4.5.2").revisions).default;
        "filepath".revision = (((hackage."filepath")."1.4.2.1").revisions).default;
        "auto-update".revision = (((hackage."auto-update")."0.1.6").revisions).default;
        "asn1-types".revision = (((hackage."asn1-types")."0.3.4").revisions).default;
        "hspec-core".revision = (((hackage."hspec-core")."2.7.1").revisions).default;
        "gitrev".revision = (((hackage."gitrev")."1.3.1").revisions).default;
        "unix-compat".revision = (((hackage."unix-compat")."0.5.2").revisions).default;
        "unix-compat".flags.old-time = false;
        "monad-control".revision = (((hackage."monad-control")."1.0.2.3").revisions).default;
        "process".revision = (((hackage."process")."1.6.8.2").revisions).default;
        "kan-extensions".revision = (((hackage."kan-extensions")."5.2").revisions).default;
        "network-bsd".revision = (((hackage."network-bsd")."2.8.1.0").revisions).default;
        "scotty".revision = (((hackage."scotty")."0.12").revisions).default;
        "wai-logger".revision = (((hackage."wai-logger")."2.3.6").revisions).default;
        "th-lift".revision = (((hackage."th-lift")."0.8.1").revisions).default;
        "resourcet".revision = (((hackage."resourcet")."1.2.4.2").revisions).default;
        "pretty".revision = (((hackage."pretty")."1.1.3.6").revisions).default;
        "cabal-doctest".revision = (((hackage."cabal-doctest")."1.0.8").revisions).default;
        "aeson".revision = (((hackage."aeson")."1.5.2.0").revisions).default;
        "http-types".revision = (((hackage."http-types")."0.12.3").revisions).default;
        "ghc-boot-th".revision = (((hackage."ghc-boot-th")."8.10.1").revisions).default;
        "base-orphans".revision = (((hackage."base-orphans")."0.8.2").revisions).default;
        "http-date".revision = (((hackage."http-date")."0.0.8").revisions).default;
        "th-abstraction".revision = (((hackage."th-abstraction")."0.3.2.0").revisions).default;
        "memory".revision = (((hackage."memory")."0.15.0").revisions).default;
        "memory".flags.support_bytestring = true;
        "memory".flags.support_basement = true;
        "memory".flags.support_foundation = true;
        "memory".flags.support_deepseq = true;
        "fast-logger".revision = (((hackage."fast-logger")."3.0.1").revisions).default;
        "bsb-http-chunked".revision = (((hackage."bsb-http-chunked")."0.0.0.4").revisions).default;
        "array".revision = (((hackage."array")."0.5.4.0").revisions).default;
        "conduit-extra".revision = (((hackage."conduit-extra")."1.3.5").revisions).default;
        "simple-sendfile".revision = (((hackage."simple-sendfile")."0.2.30").revisions).default;
        "simple-sendfile".flags.allow-bsd = true;
        "integer-gmp".revision = (((hackage."integer-gmp")."1.0.3.0").revisions).default;
        };
      compiler = {
        version = "8.10.1";
        nix-name = "ghc8101";
        packages = {
          "void" = "0.7.3";
          "semigroupoids" = "5.3.4";
          "free" = "5.1.3";
          "exceptions" = "0.10.4";
          "MissingH" = "1.4.3.0";
          "binary" = "0.8.8.0";
          "hslogger" = "1.3.1.0";
          "ghc-prim" = "0.6.1";
          "xml-types" = "0.3.8";
          "utf8-string" = "1.0.1.1";
          "old-time" = "1.1.0.3";
          "bifunctors" = "5.5.7";
          "split" = "0.2.3.4";
          "stm" = "2.5.0.0";
          "base-compat-batteries" = "0.11.1";
          "xml-conduit" = "1.8.0.1";
          "unix" = "2.7.2.2";
          "mtl" = "2.2.2";
          "network-uri" = "2.6.3.0";
          "regex-base" = "0.94.0.0";
          "zlib" = "0.6.2.1";
          "rts" = "1.0";
          "regex-posix" = "0.96.0.0";
          "adjunctions" = "4.4";
          "invariant" = "0.5.3";
          "distributive" = "0.6.2";
          "scientific" = "0.3.6.2";
          "parallel" = "3.2.2.0";
          "deepseq" = "1.4.4.0";
          "css-text" = "0.1.3.0";
          "random" = "1.1";
          "uuid-types" = "1.0.3";
          "tagsoup" = "0.14.8";
          "network" = "3.1.1.1";
          "async" = "2.2.2";
          "dlist" = "0.8.0.8";
          "conduit" = "1.3.2";
          "semigroups" = "0.19.1";
          "data-default" = "0.7.1.1";
          "data-default-instances-old-locale" = "0.0.1";
          "parsec" = "3.1.14.0";
          "directory" = "1.3.6.0";
          "transformers-compat" = "0.6.5";
          "template-haskell" = "2.16.0.0";
          "mono-traversable" = "1.0.15.1";
          "vector" = "0.12.1.2";
          "call-stack" = "0.2.0";
          "primitive" = "0.7.1.0";
          "profunctors" = "5.5.2";
          "blaze-builder" = "0.4.1.0";
          "base-compat" = "0.11.1";
          "regex-compat" = "0.95.2.0";
          "time-compat" = "1.9.3";
          "tagged" = "0.8.6";
          "lens" = "4.19.2";
          "unliftio-core" = "0.2.0.1";
          "containers" = "0.6.2.1";
          "integer-logarithms" = "1.0.3";
          "reflection" = "2.1.6";
          "these" = "1.1.1.1";
          "streaming-commons" = "0.2.2.1";
          "bytestring" = "0.10.10.0";
          "markdown" = "0.1.17.4";
          "either" = "5.0.1.1";
          "old-locale" = "1.0.0.7";
          "StateVar" = "1.2";
          "typed-process" = "0.2.6.0";
          "contravariant" = "1.5.2";
          "xss-sanitize" = "0.3.6";
          "data-default-instances-dlist" = "0.0.1";
          "blaze-markup" = "0.8.2.7";
          "text" = "1.2.3.2";
          "Cabal" = "3.2.0.0";
          "assoc" = "1.0.1";
          "unordered-containers" = "0.2.11.0";
          "base" = "4.14.0.0";
          "comonad" = "5.0.6";
          "time" = "1.9.3";
          "data-default-class" = "0.1.2.0";
          "mustache" = "2.3.1";
          "vector-algorithms" = "0.8.0.3";
          "transformers" = "0.5.6.2";
          "hashable" = "1.3.0.0";
          "data-default-instances-containers" = "0.0.1";
          "attoparsec" = "0.13.2.4";
          "blaze-html" = "0.9.1.2";
          "transformers-base" = "0.4.5.2";
          "filepath" = "1.4.2.1";
          "process" = "1.6.8.2";
          "kan-extensions" = "5.2";
          "network-bsd" = "2.8.1.0";
          "th-lift" = "0.8.1";
          "resourcet" = "1.2.4.2";
          "pretty" = "1.1.3.6";
          "aeson" = "1.5.2.0";
          "ghc-boot-th" = "8.10.1";
          "base-orphans" = "0.8.2";
          "th-abstraction" = "0.3.2.0";
          "array" = "0.5.4.0";
          "conduit-extra" = "1.3.5";
          "integer-gmp" = "1.0.3.0";
          };
        };
      };
  extras = hackage:
    {
      packages = {
        dataflow = ./.plan.nix/dataflow.nix;
        marketplace-examples = ./.plan.nix/marketplace-examples.nix;
        c4-model = ./.plan.nix/c4-model.nix;
        };
      };
  modules = [
    ({ lib, ... }:
      {
        packages = {
          "dataflow" = { flags = {}; };
          "marketplace-examples" = { flags = {}; };
          "c4-model" = { flags = {}; };
          };
        })
    ];
  }