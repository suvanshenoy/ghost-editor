{
  description = "A Flake for ghost-editor";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    mixNixDeps = import ./deps.nix {
      lib = pkgs.lib;
      beamPackages = pkgs.beamPackages;
    };
  in {
    defaultPackage.${system} = pkgs.stdenv.mkDerivation {
      name = "ghost-editor";
      src = ./.;
      beamDeps = builtins.attrValues mixNixDeps;
      buildInputs = with pkgs;[
        beamPackages.hex
        beamPackages.elixir_1_19
        beamPackages.erlang
        zig
        git
      ];

      configurePhase = ''
        export ELIXIR_ERL_OPTIONS="+fnu"
      '';

      buildPhase = ''
        MIX_ENV=prod mix release
      '';

      installPhase = ''
         mkdir -pv $out/bin
         install -t $out/bin $src/burrito_out/ghost_editor
       '';

    };
    };
}
