# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, fetchurl, libX11, libXinerama, libXft, writeText, patches ? [ ], conf ? null, stdenv, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;

  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
	  src = /home/ilya/.config/dwm;
  };
#  services.xserver.windowManager.dwm.package = pkgs.dwm.override {
#	  patches = [
#			  (pkgs.fetchpatch {
#			   url = "https://dwm.suckless.org/patches/alwayscenter/dwm-alwayscenter-20200625-f04cac6.diff";
#			   sha256 = "1hzq9crj13vxy4720xn2g0398fgwr12n7gd8j8wm6i45b56w34aw";
#			   })
#	  ];
#  };
#  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
#	  src = ./dwm;
#  };


 # services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
 #         fetchFromGithub {
 #       	  owner = "ilya-grigoriev";
 #       	  repo = "st" ;
 #       	  rev = "bf97756";
 #       	  sha256 = "11syjsks03y20x8dfjyknqmsq1h6cm4sn9akpd4wmh9pi16xxd02";
 #         };
 # };
# services.xserver.desktopManager.gnome.enable = true;
# services.displayManager.sddm.enable = true;
  

  # Configure keymap in X11
  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:alt_shift_toggle,caps:ctrl_modifier";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = true;

  # Enable bluetooth.
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.libinput.touchpad.tapping = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ilya = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       brave
       tree
       dmenu
       st
       gcc
       xorg.libX11.dev
       xorg.libXft
       xorg.libXinerama
       flameshot
       picom
     ];
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   	wget
   	tmux
	fastfetch
	tmux
	git
	less
	htop
	lynx
	w3m
	pkg-config
	gnumake
	lolcat
	fzf
	fd
	ripgrep
	lua
	man 
	usbutils
	entr
	pandoc 
	yt-dlp
	unzip 
	feh
	xsel
	xclip
	tldr
	bash-completion
	kolourpaint
	cmake
	mpv
	zathura
	gimp
	nnn
	cmus
	obs-studio
	gnugrep
	bc
	xorg.xinit
	dunst
	gh
	lazygit
	groff
	bluetuith
	bluez
	bluez-tools
	pyenv
	pipx
	telegram-desktop
   ];
# services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
#	  src = fetchurl {
#		  url = "https://github.com/ilya-grigoriev/dwm/blob/main/dwm.tar.gz";
#		  sha256 = "1p3v1xhl829dscyl6l9bfsp27qs3q4fz2mky29lxm9jp6s6gzrl0";
#	  };
#  };
 # nixpkgs.overlays = [
 #         (final: prev: {
 #          dwm = prev.dwm.overrideAttrs (old: {src = /home/ilya/.config/dwm;}); 
 #          })
 # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}

