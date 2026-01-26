{ config, pkgs, pkgs-stable, ... }:

{
  home.username = "yourUser";
  home.homeDirectory = "/home/yourUser";

  home.stateVersion = "25.05";

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "robbyrussell";
    };
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];


  programs.git = {
    enable = true;
    settings = {
      user.name = "";
      user.email = "";
      pull.rebase = true;
    };
  };

  programs.dank-material-shell = {
    enable = true;

  };
  programs.firefox.enable = true;

 
  home.packages = let
  libbluray = pkgs.libbluray.override {
    withAACS = true;
    withBDplus = true;
  };
  myVlc = pkgs.vlc.override { inherit libbluray; };
  in with pkgs; [
    myVlc
    testdisk
    gdb
    nodejs_25
    promptfoo
    gnumake
    lmstudio
    semgrep
    checkov
    p7zip
    wireguard-tools
    putty
    usbutils
    appimage-run
    exegol
    
    sqlitebrowser
    posting
    obsidian
    quickemu 
    pipx
    lsof
    podman-compose
    distrobox
    clinfo
    vim
    wget
    vscode
    helix
    ghostty
    python3
    neofetch
    gnome-tweaks
    protonvpn-gui
    pass
    unityhub
    gnupg
    (pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    }))
    dunst
    libnotify
    hyprpaper
    swaybg
    wpaperd
    mpvpaper
    swww

    kitty

    rofi
    wofi

    gammastep

    networkmanagerapplet

    grim
    slurp
    wl-clipboard
    cliphist
    overskride

    hyprshot
    pavucontrol
    wlogout
    yad
    brightnessctl
    xwayland-satellite

    mpv-unwrapped
    kdePackages.kdenlive
    pdftk
    libreoffice-qt6-fresh
    playerctl
    mpc
    jq
    maim
    simple-mtpfs
    ffmpeg
    fusePackages.fuse_2
    wmctrl
    xclip
    xorg.xeyes
    go  
    hwinfo
    dmidecode
    
    unrar
  ];
}

