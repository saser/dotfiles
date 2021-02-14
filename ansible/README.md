# macOS dotfiles
1. Install Ansible, following the instructions at https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html. If installing with `pip`, make sure to use Python 3, which is done by using `python3` instead of `python` at the time of writing.
1. Install the Ansible external dependencies: `ansible-galaxy collection install -r requirements.yml`
1. Run the playbook: `ansible-playbook macbookpro.yml -K`

## Manual steps
There are some things in my dotfiles that cannot be automatically installed. These are listed here.

### iTerm2 color scheme
Look at the [base16-iterm2 repository](https://github.com/martinlindhe/base16-iterm2) for instructions on how to install the color scheme. Do use the 256 variation.

### iTerm2 font
The font is installed by including the `iosevka` role, however it needs to be manually enabled. Go to "Preferences > Profiles > Text" and set the font, ideally size 16.

### Adding SSH key passphrase to the `ssh-agent`
Run `ssh-add -K ~/.ssh/id_rsa` (replacing the path to the private key as necessary). Verify that it is added by running `ssh-add -l`.
