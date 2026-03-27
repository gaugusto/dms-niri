{ config, pkgs, inputs, lib, ...}: 
{
  home.username = "gaugusto";
  home.homeDirectory = "/home/gaugusto";
  home.stateVersion = "25.11";

  services.polkit-gnome.enable = true;

  services.cliphist = {
    enable = true;
    systemdTargets = ["niri.service"];
    extraOptions = [
      "-max-dedupe-search"
      "10"
      "-max-items"
      "500"
    ];
    allowImages = true;
  };

  # programs.bash = {
  #   enable = true;
  #
  #   shellAliases = {
  #     btw = "echo I use Niri btw";
  #     rebuild-s = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#niri-btw";
  #     rebuild-b = "sudo nixos-rebuild boot --flake ~/nixos-dotfiles#niri-btw";
  #   };
  # };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      btw = "echo I use Niri btw";
      nrs = "sudo nixos-rebuild switch --impure --flake ~/dms-niri/nix#niri-btw";
      nrb = "sudo nixos-rebuild boot --impure --flake ~/dms-niri/nix#niri-btw";
    };

    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ 
    #     "git" 
    #     "sudo" 
    #     "docker" 
    #     "command-not-found" 
    #   ];
    #   theme = "robbyrussell"; 
    # };
  };

  programs.alacritty.enable = true;

  home.file.".config/niri".source = ../niri/.config/niri;
  home.file.".config/alacritty".source = ../alacritty/.config/alacritty;
  home.file.".config/vim".source = ../vim/.config/vim;
  home.file.".config/backgrounds".source = ../backgrounds/.config/backgrounds;
  home.file.".config/DankMaterialShell".source = ../dms/.config/DankMaterialShell;
  home.file.".config/mpv".source = ../mpv/.config/mpv;
  home.file.".config/nvim".source = ../nvim/.config/nvim;
  home.file.".config/walker".source = ../walker/.config/walker;
  home.file.".local/bin".source = ../scripts/.local/bin;
  home.file.".gitconfig".source = ../git/.gitconfig;
  # home.file.".zshrc".source = ../zsrc/.zshrc;

  home.packages = with pkgs; [
    lazygit
    tree
    bat
    eza
    btop
    walker
  ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true; # Ative se usar X11 (i3, bspwm, etc.)
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
}
