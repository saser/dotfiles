# dotfiles

These are the dotfiles I use for the various computers I have. They are based on Ansible, to allow
for complex but declarative configuration. The idea is to have a single collection of roles where
each role takes care of doing OS-specific configuration, and one simply creates a playbook (like
`desktop-archlinux.yml` or `macbookpro-macos.yml` where an appropriate set of roles are specified.

## Installation

1. (macOS only) Install Homebrew Ansible, and Git first.
    - Homebrew: https://brew.sh/Installation
    - Ansible: `brew install ansible`
    - Git: `brew install git`
1. Clone the repository recursively: `git clone --recursive https://github.com/Saser/dotfiles`.
    * Alternatively, if already cloned, do `git submodule init && git submodule update`.
1. Install the Ansible external dependencies: `ansible-galaxy collection install -r requirements.yml`
1. Run the appropriate playbook: `ansible-playbook -K <playbook file>`

## Manual steps
There are some things in my dotfiles that cannot be automatically installed (at least not in a
reliable and automated way). They are listed here.

### iTerm2 color scheme (macOS only)
Look at the [base16-iterm2 repository](https://github.com/martinlindhe/base16-iterm2) for
instructions on how to install the color scheme. Do use the 256 variation.

### iTerm2 font (macOS only)
The font is installed by including the `iosevka` role, however it needs to be manually enabled. Go
to "Preferences > Profiles > Text" and set the font, ideally size 16.

### Adding SSH key passphrase to the `ssh-agent` (macOS only)
Run `ssh-add --apple-use-keychain ~/.ssh/id_rsa` (replacing the path to the private key as necessary). Verify that it
is added by running `ssh-add -l`.

### Setting the monospace font in Chrome
Go to chrome://settings/fonts and set "Fixed Width Font" to whatever font desired.
