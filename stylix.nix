{ pkgs, ... }:

let
  stylix = pkgs.fetchFromGitHub {
      owner = "danth";
      repo = "stylix";
      rev = "e59d2c1725b237c362e4a62f5722f5b268d566c7";
  };
in {
    imports = [ (import stylix).nixosModules.stylix ];

    stylix = {
      enable = true;
    };
}
