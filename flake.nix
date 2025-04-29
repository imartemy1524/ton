{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flakelight = {
      url = "github:nix-community/flakelight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { flakelight, ... }:
    flakelight ./. {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      devShell.packages = pkgs: [
        pkgs.ninja
        pkgs.libsodium
        pkgs.libmicrohttpd
        pkgs.pkg-config
        pkgs.automake
        pkgs.libtool
        pkgs.autoconf
        pkgs.gnutls
        pkgs.llvm_16
        pkgs.openssl_3
        pkgs.zlib
        pkgs.cmake
      ];
    };
}
