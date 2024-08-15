{ config, lib, pkgs, ... }:

{
 imports =
   [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
    ./disk-config.nix
  ];

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # timezone
  time.timeZone = "Europe/Berlin";

  # packages
  environment.systemPackages = with pkgs; [
    vim
    docker
  ];

}
