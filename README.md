# Dotfiles
These are my dotfiles and other settings files that I use for my daily use. They are intended to be used on Arch Linux, but should probably work on most Linux systems.

## Goals
I started this repository after feeling that my previous dotfiles repository were a bit messy, and this time I would Get It Right™. I have a few goals in mind:

*   **A clear and intuitive directory structure**. When using my dotfiles, it should be easy to think of a feature and then find its corresponding file(s) without having to `grep` too much.
*   **Installation and uninstallation with a single shell command, even in a completely new system**. After cloning the repository, a single shell command should be sufficient to get everything installed -- including plugins and other third-party stuff. It should be as easy to uninstall everything as well.
*   **Be somewhat configurable and not break completely on unexpected changes**. For example, I usually keep my dotfiles in `~/dotfiles`, but should I choose to keep them somewhere else, my configuration(s) should still work (and the installation/uninstallation above mentioned above should still work as well).
*   **As little "magic" as possible**. When reading these files, it should be clear what each line does. For example, to always use GNU style long options when available, comment any plugins used, etc. The dotfiles should be written such that when reading them, thinking _"What the heck does this setting/line/plugin/whatever do?"_ should be answered by reading the surround lines.

## Installation
In order to **install** these dotfiles, the following must be installed:

*   [git](git-scm): for cloning this repository, the repositories of third-party plugins, etc.
*   [GNU Stow](gnu-stow): for creating (and removing) symbolic links to the files contained within these repositories.

Both are available in the official repositories:

    $ sudo pacman -S git stow

When the above are installed, issuing the following commands will fetch everything -- clone this and third-party repositories, download plugins, etc -- and put symbolic links in the correct places.

    $ git clone --recursive https://github.com/Saser/dotfiles
    $ cd dotfiles
    $ ./install.sh

Additionally, in order to use the supplied `package-sync.rb` script, as well as the `download-images.rb` script (located in `wallpapers/.wallpapers`), Ruby needs to be installed first. Why Ruby, you might ask. Answer: I did not want to bother with learning more advanced string manipulation in `sh` scripting, so Ruby it is.

    $ sudo pacman -S ruby

If no output is shown on screen, everything has (probably) went well.

[git-scm]: https://git-scm.com/
[gnu-stow]: https://www.gnu.org/software/stow/

## Programs and applications
I use the following programs and applications on my system(s).

*   [zsh](zsh): a nice shell, with lots of fancy plugins and features.
*   [neovim](neovim): a fork of Vim, with a focus on modern features.

[zsh]: https://www.zsh.org/
[neovim]: https://neovim.io/
