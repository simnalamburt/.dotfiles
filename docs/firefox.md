파이어폭스 설정
========
모든 파이어폭스 설정이 파이어폭스 계정을 통해 자동으로 동기화되지는 않는다.
이하는 그러한 설정들의 모음이다.

1.  [HNTP] 플러그인 설정 수정

    - 웹사이트 아이콘은 구글 통해 받아오도록
    - 테마는 "Midnight"
    - 배경색은 `#2a292e`

2.  about:config 에서 DoH 활성화, 키보드+휠 동작 커스텀화

    ```
    network.trr.mode;2
    mousewheel.with_alt.action;1
    mousewheel.with_control.action;1
    ```
    
###### References
- https://wiki.mozilla.org/Trusted_Recursive_Resolver#DNS-over-HTTPS_Prefs_in_Firefox

[HNTP]: https://github.com/quodroc/HumbleNewTabPage
