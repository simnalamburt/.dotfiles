브라우저 설정
========
모든 브라우저 설정이 파이어폭스 계정/구글 계정 등을 통해 자동으로 동기화되지는 않는다.
이하는 그러한 설정들의 모음이다.

### Firefox
1.  DNS over HTTPS 사용 체크, Cloudflare 사용
2.  키보드+휠 동작 커스텀화
    ```
    mousewheel.with_alt.action;1
    browser.fullscreen.exit_on_escape;false
    ```
3.  툴바 커스터마이즈 (모든 우상단 버튼들을 overflow 메뉴로 넘기기)
4.  북마크 툴바 표시 안함
5.  브라우저 확장 설정 세팅 혹은 동기화
    - uBlock Origin: subscribe [youslist], Run in private window
    - Bitwarden Password Manager: Sign in to <https://pass.hyeon.me>
    - Violentmonkey: Sync to Google Drive, Run in private window
    - refined-naver-blog: Run in private window

[youslist]: https://github.com/yous/YousList

### Chrome
1.  "Use secure DNS" 사용 체크, Cloudflare 사용
