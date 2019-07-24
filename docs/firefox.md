파이어폭스 설정
========
모든 파이어폭스 설정이 파이어폭스 계정을 통해 자동으로 동기화되지는 않는다.
이하는 그러한 설정들의 모음이다.

1.  파이어폭스 68 이상을 쓸것

2.  [HNTP] 플러그인 설정 수정

    - 웹사이트 아이콘은 구글 통해 받아오도록
    - 테마는 "Midnight"
    - 배경색은 `#2a292e`

3.  <about:config>에서 아래 값들 수정

    ```
    browser.in-content.dark-mode;true
    network.trr.mode;2
    mousewheel.with_meta.action;1
    ```

4.  [UserContent.css] 에 아래 코드 삽입

    ```
    @-moz-document url("about:blank") {
      html {
        background-color: #2A292E;
      }
    }
    ```

    출처: https://www.reddit.com/r/firefox/comments/822j2y/how_do_you_stop_firefox_from_flashing_a_white/dv7jix2/

[HNTP]: https://github.com/quodroc/HumbleNewTabPage
[UserContent.css]: https://www.userchrome.org/
