{
  description = "phanpy devshell";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [ nodePackages.npm ];
        shellHook = ''
          unset SOURCE_DATE_EPOCH # don't set image build dates to 1980
          source .env
        '';
      };
    };
}
