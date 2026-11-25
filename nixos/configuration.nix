# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./bash.nix
    ];

  #Not for me
  

  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "nixos"; # Define your hostname.
  
  #Window manager
  programs.hyprland = {
      enable = true;
      withUWSM = true; # recommended for most users
      xwayland.enable = true; # Xwayland can be disabled.
  };
  xdg.portal = {
    	enable = true;
    	extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };
  services.xserver.enable = true;
  services.displayManager = {
         sddm.enable = true;
         sddm.wayland.enable = true;
  };
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = false;
      timeout = 1;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
    plymouth = {
      enable = false;
      theme = "spinfinity";
    };
  };

  #NVIDIA
#   hardware.graphics = {
#    enable = true;
#    enable32Bit = true; # Recommended for Steam and 32-bit apps
#   };
#   services.xserver.videoDrivers = [ "nvidia" ];
#   hardware.nvidia = {
#     # Required for RTX 50-series (Blackwell) GPUs
#     open = true;

     # Required for Wayland compositors
#     modesetting.enable = true;

     # Enable the nvidia-settings control panel
 #    nvidiaSettings = true;

     # Use the standard stable driver branch
#     package = config.boot.kernelPackages.nvidiaPackages.latest;
#   };
   # boot.kernelParams = [ "nvidia_drm.fbdev=0" ];
    # Load NVIDIA modules early to prevent display manager race conditions
   # boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  }; 

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fruitsnacks = {
    isNormalUser = true;
    description = "fruitsnacks";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "fruitsnacks";

  # Install firefox.
  programs.firefox.enable = true;
  #programs.steam.enable = true;

  #Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
