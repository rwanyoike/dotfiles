{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2405.*";
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
            bat
            bottom
            chezmoi
            cpufetch
            curlie
            delta
            doggo
            duf
            emacs-nox
            exiftool
            eza
            fastfetch
            fava
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
            mediainfo
            miniserve
            mise
            neovim
            nmap
            oh-my-zsh
            ouch
            p7zip
            rclone
            rename
            ripgrep
            sd
            speedtest-cli
            sqlite-interactive
            tealdeer
            tmux
            trash-cli
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
