Setup note
========
### A. Basic customization
1.  Install [Cascadia Code](https://github.com/microsoft/cascadia-code)

1.  Remap [Caps Lock → Control](https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/capslock-to-control.reg)

1.  Disable snap assistant

    <img width=500 src="https://raw.githubusercontent.com/simnalamburt/i/master/.dotfiles/disable-snap-assist.png">

1.  Disable Activity History. It has not only a privacy issue, but also a disturbance at the Task View screen.

    <img width=500 src="https://raw.githubusercontent.com/simnalamburt/i/master/.dotfiles/disable-activity-history.png">

1.  (Optional) Enable Hyper-V and Windows Sandbox.

<br>

### B. Install [scoop](https://scoop.sh/)
1.  Set ExecutionPolicy as `RemoteSigned`.

    ```powershell
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    ```

1.  Download and execute scoop installer.

    ```powershell
    iwr -useb get.scoop.sh | iex
    ```

1.  Install git. This is requied for next steps.

    ```powershell
    scoop install git
    ```

1.  Enable `extras` repo.

    ```powershell
    scoop bucket add extras
    ```

<br>

### C. Setup Windows Subsystem for Linux
1.  [Install WSL.](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

1.  Edit `/etc/profile`, `/etc/bashrc`, or `/etc/bash.bashrc` and uncomment or add the line below:

    ```bash
    umask 022
    ```
