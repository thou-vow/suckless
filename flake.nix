{
  description = "Suckless tools for thou-vow";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    systems = [
      "x86_64-linux"
    ];

    eachPkgs = nixpkgs.lib.genAttrs systems (system: nixpkgs.legacyPackages.${system});
  in {
    packages = nixpkgs.lib.genAttrs systems (system: {
      st = eachPkgs.${system}.callPackage ./st.nix;
    });
  };
}
