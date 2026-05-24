{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    asciichart = buildMix rec {
      name = "asciichart";
      version = "1.2.0";

      src = fetchHex {
        pkg = "asciichart";
        version = "${version}";
        sha256 = "28a870099bf7c6f6367953874f53445e4a882566dd8ac2e9e701989f967d374d";
      };

      beamDeps = [];
    };

    burrito = buildMix rec {
      name = "burrito";
      version = "1.5.0";

      src = fetchHex {
        pkg = "burrito";
        version = "${version}";
        sha256 = "3861abda7bffa733862b48da3e03df0b4cd41abf6fd24b91745f5c16d971e5fa";
      };

      beamDeps = [ jason req typed_struct ];
    };

    elixir_make = buildMix rec {
      name = "elixir_make";
      version = "0.9.0";

      src = fetchHex {
        pkg = "elixir_make";
        version = "${version}";
        sha256 = "db23d4fd8b757462ad02f8aa73431a426fe6671c80b200d9710caf3d1dd0ffdb";
      };

      beamDeps = [];
    };

    ex_termbox = buildMix rec {
      name = "ex_termbox";
      version = "1.0.2";

      src = fetchHex {
        pkg = "ex_termbox";
        version = "${version}";
        sha256 = "ca7b14d1019f96466a65ba08bd6cbf46e8b16f87339ef0ed211ba0641f304807";
      };

      beamDeps = [ elixir_make ];
    };

    finch = buildMix rec {
      name = "finch";
      version = "0.22.0";

      src = fetchHex {
        pkg = "finch";
        version = "${version}";
        sha256 = "b94e83c47780fc6813f746a1f1a34ee65cda42da4c5ea26a68f0acc4498e23dc";
      };

      beamDeps = [ mime mint nimble_options nimble_pool telemetry ];
    };

    hpax = buildMix rec {
      name = "hpax";
      version = "1.0.3";

      src = fetchHex {
        pkg = "hpax";
        version = "${version}";
        sha256 = "8eab6e1cfa8d5918c2ce4ba43588e894af35dbd8e91e6e55c817bca5847df34a";
      };

      beamDeps = [];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.4.5";

      src = fetchHex {
        pkg = "jason";
        version = "${version}";
        sha256 = "b0c823996102bcd0239b3c2444eb00409b72f6a140c1950bc8b457d836b30684";
      };

      beamDeps = [];
    };

    mime = buildMix rec {
      name = "mime";
      version = "2.0.7";

      src = fetchHex {
        pkg = "mime";
        version = "${version}";
        sha256 = "6171188e399ee16023ffc5b76ce445eb6d9672e2e241d2df6050f3c771e80ccd";
      };

      beamDeps = [];
    };

    mint = buildMix rec {
      name = "mint";
      version = "1.8.0";

      src = fetchHex {
        pkg = "mint";
        version = "${version}";
        sha256 = "f3c572c11355eccf00f22275e9b42463bc17bd28db13be1e28f8e0bb4adbc849";
      };

      beamDeps = [ hpax ];
    };

    nimble_options = buildMix rec {
      name = "nimble_options";
      version = "1.1.1";

      src = fetchHex {
        pkg = "nimble_options";
        version = "${version}";
        sha256 = "821b2470ca9442c4b6984882fe9bb0389371b8ddec4d45a9504f00a66f650b44";
      };

      beamDeps = [];
    };

    nimble_pool = buildMix rec {
      name = "nimble_pool";
      version = "1.1.0";

      src = fetchHex {
        pkg = "nimble_pool";
        version = "${version}";
        sha256 = "af2e4e6b34197db81f7aad230c1118eac993acc0dae6bc83bac0126d4ae0813a";
      };

      beamDeps = [];
    };

    ratatouille = buildMix rec {
      name = "ratatouille";
      version = "0.5.1";

      src = fetchHex {
        pkg = "ratatouille";
        version = "${version}";
        sha256 = "b2394eb1cc662eae53ae0fb7c27c04543a6d2ce11ab6dc41202c5c4090cbf652";
      };

      beamDeps = [ asciichart ex_termbox ];
    };

    req = buildMix rec {
      name = "req";
      version = "0.5.18";

      src = fetchHex {
        pkg = "req";
        version = "${version}";
        sha256 = "fa03812c440a9754bf34355e0c5d4f3ed316458db62e3284b7a352ef8dc0b996";
      };

      beamDeps = [ finch jason mime ];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.4.2";

      src = fetchHex {
        pkg = "telemetry";
        version = "${version}";
        sha256 = "928f6495066506077862c0d1646609eed891a4326bee3126ba54b60af61febb1";
      };

      beamDeps = [];
    };

    typed_struct = buildMix rec {
      name = "typed_struct";
      version = "0.3.0";

      src = fetchHex {
        pkg = "typed_struct";
        version = "${version}";
        sha256 = "c50bd5c3a61fe4e198a8504f939be3d3c85903b382bde4865579bc23111d1b6d";
      };

      beamDeps = [];
    };
  };
in self

