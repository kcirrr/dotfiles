function bu() {
    echo "Xcode commandline tools already installed"
    echo "Make sure Xcode commandline tools is installed"
    xcode-select --install && read -rp "Press enter to continue" || true
    echo "Updating Homebrew package list..."
    brew update || exit
    echo "Upgrading Homebrew packages..."
    brew upgrade
    echo "Upgrading Homebrew casks..."
    brew upgrade --cask
    echo "Upgrading Krew plugins..."
    kubectl krew upgrade
}

function sshretry()
{
    false
    while [ $? -ne 0 ]; do
        ssh "$@" || (sleep 1;false)
    done
}

function sshn() {
    ssh -o PubkeyAuthentication=no "$1"
}

function sshs() {
    grep -i "$1" "$HOME"/.ssh/completion.d/*.list
}

function mkvenv() {
    python3 -m venv "$HOME/.venvs/$1"
}

function lc() {
    lxc exec "$1" -- sudo /bin/bash
}

function ks() {
    kubectl exec -i -t "$1" "--" sh -c "(bash || ash || sh)"
}
