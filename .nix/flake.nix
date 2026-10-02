{
  description = "Yggdrasil development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # Rust
            rustc
            cargo
            rustfmt
            clippy
            rust-analyzer

            # Python
            uv

            # C / C++
            clang
            clang-tools

            # Shell
            shellcheck
            shfmt

            # Nix
            nixfmt

            # General development
            pkg-config
            openssl
            just
          ];

          RUST_BACKTRACE = "1";

          shellHook = ''
            echo "ᚾ Yggdrasil"
          '';
        };
        formatter = pkgs.nixfmt;
      }
    );
}
