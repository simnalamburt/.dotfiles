Using Arch Linux in WSL2
========

1.  Install Arch using Scoop

    ```powershell
    scoop install archwsl
    ```

2.  Basic setup

    ```bash
    #
    # Use "wheel" as sudoers' group
    #
    EDITOR=vim visudo
    # %wheel ALL=(ALL) ALL


    #
    # Create a new user
    #
    useradd -m -G wheel -s /bin/bash simnalamburt
    passwd simnalamburt


    #
    # Setup pacman
    #
    pacman-key --init
    pacman-key --populate

    vim /etc/pacman.d/mirrorlist
    # https://mirror.premi.st/archlinux/
    #
    # Reference:
    #   https://archlinux.org/mirrors/status/

    vim /etc/pacman.conf
    # Add `ParallelDownloads = 5` under `[options]`


    #
    # Remove unused packages
    #
    pacman -R vim
    ```

3.  Change the default user

    ```powershell
    arch.exe config --default-user simnalamburt
    ```

4.  (Optional) Create handy symlinks

    ```bash
    ln -s '/mnt/c/Users/simna/OneDrive/바탕 화면' Desktop
    ln -s '/mnt/c/Users/simna/Downloads'
    ln -s '/mnt/c/Windows/System32/drivers/etc/hosts'
    mkdir workspace
    ```

### References
- https://github.com/yuk7/ArchWSL
- https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/
