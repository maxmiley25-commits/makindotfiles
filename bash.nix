{ config, pkgs, ... }:{
programs.bash = {
shellAliases = {
	editnix = "sudo nano /etc/nixos/configuration.nix";
	editbash = "sudo nano /etc/nixos/bash.nix";
	editpack = "sudo nano /etc/nixos/packages.nix";
	updatenix = "sudo nixos-rebuild switch";
	connect = "nmcli device wifi connect Jester's Delight --ask";
	rofi = "rofi -show drun";
};
};
}
