{ pkgs, ... }: {

  imports = [
    ./darwin-application-activation.nix
  ];


  home.username = "gsorchini";
  home.homeDirectory = "/Users/gsorchini";

  home.packages = [
    # fonts
    pkgs.fira-code
    pkgs.roboto-mono
    # (pkgs.nerdfonts.override { fonts = ["FiraCode" "RobotoMono"];})

    # else
    pkgs.nixpkgs-fmt
    pkgs.neofetch
    pkgs.ffmpeg_5
    pkgs.element-desktop
  ];

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "gsorchini";
    userEmail = "gsorchini@ea.com";
  };

  programs.emacs.enable = true;
  programs.emacs.extraPackages = epkgs: with epkgs; [
    nano-theme
  ];

  fonts.fontconfig.enable = true;
}

# home-manager switch -f ./home.nix