{
  description = "Description for the project";
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    process-compose-flake.url = "github:Platonic-Systems/process-compose-flake";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.process-compose-flake.flakeModule
      ];
      systems = ["x86_64-linux" "aarch64-linux"];
      perSystem = {
        self',
        pkgs,
        lib,
        ...
      }: let
        python = pkgs.python3;
        pythonPackages = pkgs.python3Packages;
        pelican = pythonPackages.pelican;
      in {
        # `nix run` -> watch w/ live server
        apps.default = {
          type = "app";
          program = self'.packages.watch;
        };
        # `nix build` -> builds the site
        packages.default = self'.packages.blog;

        packages.blog = pkgs.stdenv.mkDerivation {
          src = ./blog;
          pname = "amgg-blog";
          version = "1";
          buildInputs = [pelican];
          buildPhase = ''
            pelican --output $out
          '';
        };
        packages.github-pages-tarball = pkgs.runCommand "blog-tarball" {} ''
          mkdir -p $out
          tar -czf $out/blog.tar.gz -C ${self'.packages.blog} .
        '';

        process-compose.watch = {
          settings.processes = {
            site-builder.command = "cd blog && ${lib.getExe' pelican "pelican"} --autoreload --delete-output-directory --ignore-cache .";
            live-server = {
              command = "${lib.getExe pkgs.live-server} --index --open / ./blog/output";
              depends_on.site-builder.condition = "process_started";
            };
          };
        };

        devShells.default = pkgs.mkShell {
          packages = [pythonPackages.pelican];
        };
      };
    };
}
