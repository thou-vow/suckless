{
  description = "Suckless tools for thou";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    packages."x86_64-linux" = {
      st = pkgs.st.overrideAttrs (prevAttrs: {
        version = "custom";

        src = ./st;
      });
    };
  };
}
