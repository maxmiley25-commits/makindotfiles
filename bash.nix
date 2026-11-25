{ config, pkgs, ... }:{
programs.bash = {
        shellAliases = {
                editNix = "sudo nano /etc/nixos/configuration.nix";
        };
};
}
