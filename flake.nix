{
  description = ''A Nim package to convert filesizes into other units, and turns filesizes into human readable strings.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."filesize-master".dir   = "master";
  inputs."filesize-master".owner = "nim-nix-pkgs";
  inputs."filesize-master".ref   = "master";
  inputs."filesize-master".repo  = "filesize";
  inputs."filesize-master".type  = "github";
  inputs."filesize-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."filesize-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}