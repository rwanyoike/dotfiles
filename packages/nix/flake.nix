{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2411.*";
  };

  outputs = { self, nixpkgs }:
    let
      # Helpers for producing system-specific outputs
      supportedSystems = [ "x86_64-linux" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs {
          inherit system;
        };
      });
    in {
      packages = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.buildEnv {
          name = "system-packages";
          # Packages available in the environment
          paths = with pkgs; [
            aria2
            asciinema
            atuin
            bandwhich
            bat
            bottom
            chezmoi
            cpufetch
            curlie
            delta
            doggo
            duf
            exiftool
            eza
            fastfetch
            fd
            fdupes
            figlet
            fq
            fzf
            gdu
            gh
            ghostscript_headless
            gitMinimal
            glibcLocales
            gmailctl
            hexyl
            htop
            imagemagick
            ipcalc
            iperf
            jq
            jrnl
            keychain
            lazygit
            libqalculate
            lurk
            mediainfo
            miniserve
            mise
            neovim
            nmap
            oh-my-zsh
            ouch
            p7zip
            pipx
            rclone
            rename
            ripgrep
            sd
            speedtest-cli
            sqlite-interactive
            tealdeer
            tmux
            trash-cli
            trippy
            vim
            wireshark-cli
            yazi
            yt-dlp
            zoxide
            zsh-autosuggestions
            zsh-history-substring-search
            zsh-powerlevel10k
            zsh-syntax-highlighting
            zsh-you-should-use
          ];
        };
      });
    };
}
