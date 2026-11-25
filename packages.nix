{ config, pkgs, inputs, ... }:{

nixpkgs.config.allowUnfree = true;

environment.systemPackages = with pkgs; [
        wayland
        git
        neovim
        vesktop
        steam
        waybar
        kitty
        home-manager
        libreoffice-fresh
        lsd
        dtrx
        sioyek
        jdk17
        python3
        vite
        openjdk
        #awww
        exercism
        live-server
        maven
        gradle
        spring-boot-cli
        #postgresql
        rofi
];

}
