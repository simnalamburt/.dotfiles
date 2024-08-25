Setup note
========
1.  Remap [Caps Lock → Control](https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/capslock-to-control.reg)

1.  Disable snap assistant

    <img width=500 src="https://raw.githubusercontent.com/simnalamburt/i/master/.dotfiles/disable-snap-assist.png">

1.  Disable Activity History. It has not only a privacy issue, but also a disturbance at the Task View screen.

    <img width=500 src="https://raw.githubusercontent.com/simnalamburt/i/master/.dotfiles/disable-activity-history.png">

1.  Block KakaoTalk ad server

    ```
    # C:\Windows\System32\drivers\etc\hosts
    127.0.0.1 display.ad.daum.net
    ```

1.  Enable Windows Sandbox.

1.  [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install).
