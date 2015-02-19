OS X
========

iTerm2              | 설명
--------------------|---------------------------------
`⌘` + `alt` + drag  | block selection
`⌘` + `t`           | new tab
`⌘` + `T`           | show tab bar
`⌘` + `1`, `2`, ... | Go to tab 1, 2, ...
`⌘` + `-`, `\ `     | new pane (horizontal, virtical)
`⌘` + `[`, `]`      | Go next pane

FFmpeg                                          | 설명
------------------------------------------------|-------------
`$ ffmpeg -i <input> -vn -acodec copy <output>` | 오디오 추출
`$ ffmpeg -i <input> -vcodec copy -an <output>` | 비디오 추출

클립보드          | 설명
------------------|-------------
`$ pbcopy < file` | 파일의 내용을 복사
`$ pbpaste`       | 붙여넣기

--------

### 맥북 처음 살때 할것들

1.  Apple ID 생성
    * Apple ID 생성, iTunes로 계정 활성화
    * iTunes로 카드번호 입력해놓기 (Option)

2.  OS 업그레이드

3.  OS 설정

    * 키 반복속도, 마우스 속도, 트랙패드 설정 변경
    * Finder 초기 디렉토리 경로 변경
    * Caps Lock → Command Key

4.  어플리케이션 설치

    * Chrome
    * Google Drive
    * xCode
    * iTerm2

5.  iTerm2 설정

    * [Solarized](https://github.com/altercation/solarized)
    * [Monaco for powerline.otf](https://gist.github.com/baopham/1838072)
    * [Access for assistive device](http://www.tekrevue.com/how-to-enable-access-for-assistive-devices-in-os-x-mavericks/)
    * Left Command Key          → Ctrl
    * Option Key                → +Esc
    * Alt + Enter               → Toggle Fullscren
    * Command + (Space, Enter)  → Do not remap Modifier
    * Cmd + (-, \)              → Split pane horizontal, vertical
    * 쓰지않는 단축키 삭제

7.  [Homebrew](http://brew.sh)

    * git
    * vim
    * wget, htop
    * gtar, xz, p7zip
    * nmap, binutils
    * ruby
    * iojs, npm
    * python, python3
    * go, mruby, nim, crystal, luajit, r
    * ocaml, ledit (with https://xquartz.macosforge.org)

8.  [Cask](http://caskroom.io)

    * xquartz

9.  [Rust](http://rust-lang.org)

    http://doc.rust-lang.org/book/installing-rust.html
