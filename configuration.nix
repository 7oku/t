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

  # ssh with default key
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILeQvOnwA1GuQs5M49dqJbgJsVvwngq/0oq75HK6947N'' ];

  # state
  system.stateVersion = "23.11";

}
