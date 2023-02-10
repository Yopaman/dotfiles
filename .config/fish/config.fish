starship init fish | source
fish_ssh_agent
alias hx helix

set -x BROWSER brave
set -x TERM "xterm-256color"
set -x EDITOR "nvim"

alias nvide 'env -u WAYLAND_DISPLAY neovide --multigrid'
alias aurpkgs 'pacman -Qm'

# opam configuration
source /home/pablo/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/pablo/.ghcup/bin # ghcup-env
