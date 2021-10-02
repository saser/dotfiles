# NixOS configuration

Contains system and user configuration for NixOS.

## Setup

This uses [Home Manager](https://github.com/nix-community/home-manager) to
handle a bunch of stuff. Home Manager is used as a NixOS module rather than a
standalone installation, meaning Home Manager is configured using
`configuration.nix` instead of a `home.nix` file.

In the below commands, make sure to use the correct NixOS version (currently,
stable at 21.05).

```shell
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz home-manager
$ nix-channel --update
$ sudo cp ./configuration.nix /etc/nixos/configuration.nix
```
