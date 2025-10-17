{
  description = "Project description";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      
      buildDeps = [
        # packages needed on runtime of the program
      ];
      
      nativeDeps = with pkgs;[
        # packages needed to build the project
      ];
      
      sharedEnv = {
        # environment for nix shell and build time
      };
      
    in {
      packages.x86_64-linux.default = pkgs.stdenv.mkDerivation ({
        pname = "Package name"; # change
        version = "0.1.0";
        src = ./.;
        buildInputs = buildDeps;
        nativeBuildInputs = nativeDeps;
        #buildPhase = '' '';
        #installPhase = '' '';
      } // sharedEnv);

      devShells.x86_64-linux.default = pkgs.mkShell ({
        buildInputs = buildDeps ++ nativeDeps;
      } // sharedEnv);
    };
}
