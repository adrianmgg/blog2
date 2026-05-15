{
  description = "Description for the project";
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
      ];
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
        self',
        pkgs,
        ...
      }: let
        python = pkgs.python3;
        pythonPackages = pkgs.python3Packages;
      in {
        packages.default = pkgs.hello;
        devShells.default = pkgs.mkShell {
          packages = [pythonPackages.pelican];
        };
      };
    };
}
