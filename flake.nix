inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-stable";   
};

outputs = {
  nixosConfigurations."blackbox" = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     modules = [
       ./disko.nix
       ./configuration.nix
     ];
   };
};
