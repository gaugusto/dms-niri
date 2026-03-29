{ config, pkgs, inputs, ... }: {
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
    ];

  boot = {
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];

    initrd.luks.devices."luks-381fe8e7-c546-4bab-abe6-b9deb2c22b53".device = "/dev/disk/by-uuid/381fe8e7-c546-4bab-abe6-b9deb2c22b53";

    loader.timeout = 0;
    loader.systemd-boot.enable = true;
    loader.systemd-boot.configurationLimit = 5;
    loader.efi.canTouchEfiVariables = true;
 
    initrd.verbose = false;
    initrd.systemd.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver 
      vpl-gpu-rt
      intel-compute-runtime
    ];
  };

  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };

  networking.hostName = "niri-btw";
  networking.networkmanager.enable = true; 

  time.timeZone = "America/Sao_Paulo";
  console.keyMap = "br-abnt2";

  i18n.defaultLocale = "en_US.UTF-8"; 
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  users.users.gaugusto = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Guilherme Augusto de Macedo";
    extraGroups = [ "networkmanager" "wheel" "video" "input" ];
    packages = with pkgs; [
    ];
  };

  security.rtkit.enable = true;
  
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.printing.enable = true;
  services.libinput.enable = true;
  services.dbus.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor = {
      name = "niri"; 
    };

    configHome = "/home/gaugusto";

    configFiles = [
      "/home/gaugusto/.config/DankMaterialShell/settings.json"
    ];

    logs = {
      save = true; 
      path = "/tmp/dms-greeter.log";
    };

    quickshell.package = pkgs.quickshell;
  };

  programs.niri.enable = true;
  programs.zsh.enable = true;
  programs.chromium.enable = true;

  programs.dms-shell = {
    enable = true;

    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;


    systemd = {
      enable = true; 
      restartIfChanged = true;
    };
  
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting from the clipboard history (wtype)
  };

  nixpkgs.config.allowUnfree = true;

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    mpv
    yt-dlp
    vim
    pass-wayland
    git
    htop
    alacritty
    stow
    nautilus
    chromium
    libnotify
    libinput
    pulseaudio
    brightnessctl
    jq
    wl-clipboard
    gsettings-desktop-schemas
    adwaita-icon-theme
    dconf
    xdg-user-dirs
    nwg-look
    adw-gtk3
    gnome-calculator
  ];

  xdg.portal.config.niri = {
    "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ]; # or "kde"
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
      cantarell-fonts
      adwaita-fonts
      dejavu_fonts
  ];

  # nix management automations
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 5d";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
