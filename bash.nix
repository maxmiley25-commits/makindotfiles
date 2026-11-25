{ config, pkgs, ... }:{
programs.bash = {
	shellAliases = {
		editnix = "sudo nano /makindotfiles/nixos/configuration.nix";
		editbash = "sudo nano /makindotfiles/bash.nix";
		editpack = "sudo nano /makindotfiles/packages.nix";
		updatenix = "sudo nixos-rebuild switch";
	};
};
}
