macOS
========

### Setup
1.  Apple ID 생성. 카드번호가 필요하다. iTunes 혹은 앱스토어를 써서 활성화해야한다.
2.  OS 최신버전으로 업데이트
3.  OS 설치 후 설정들
    - iCloud로 어느어느 항목 공유할지 설정. 데스크톱, 문서, 사진, 이메일은 공유 안하도록 함.
    - FileVault로 Full Disk Encryption 수행
    - 트랙패드/마우스 터치옵션 설정
    - 손쉬운 사용 &rarr; 트랙패드 옵션 &rarr; 세 손가락으로 드래그하기 활성화
    - 키 반복속도, 마우스 속도 설정
    - 색상 반전 키를 <kbd>⌘</kbd> + <kbd>Q</kbd> 로 리매핑해서 실수로 프로세스 종료하는것 막음.
    - Finder 사이드바, 초기 디렉토리 경로 변경, "모든 파일 확장자 보기"
    - 알림창에서 주식칸 빼기
    - 런치패드에서 안쓰는 기본앱들 전부 폴더 하나에 모음
    - 입력소스 전환키 편한걸로 변경 (⌘ + Space)
    - Caps Lock 키를 Command(⌘) 키로 수정
    - 개인 VPN 등록시키기
    - 시계 표시방식 변경
    - 메뉴막대에서 IME 보이지 않도록 변경
    - (opt) 원할경우 시스템설정 &rarr; 공유 &rarr; 원격 로그인 으로 ssh 서버 켬
    - (opt) 원할경우 메뉴 막대에서 Siri 없앰
4.  Homebrew, Homebrew-Cask 설치 및 패키지들 전부 설치
5.  소프트웨어 설치 후 설정들
    - ed25519 키 생성해서 적재적소에 등록 (주로 깃헙과 개인서버들)
    - 닷파일즈 클론
    - iTerm2 설정 임포트, iTerm2에 엑세서빌리티 권한 부여
    - `/etc/shells`에 원하는 쉘 추가, 기본 쉘 변경
    - ssh, vimrc, gitconfig, gitexclude 등의 설정들 심링크
    - chips, vim-plug 설치 후 플러그인 다운로드
    - [Monaco for powerline] 설치
    - Karabiner Elements 설정
    - 키베이스에 디바이스 추가
    - [git 커밋사인 설정](https://gist.github.com/simnalamburt/c921a9e70e9a43f5b4743499370d5a88)

<br>

### 4K가 아닌 디스플레이에 대해서도 HiDPI 강제로 활성화하기
아니 이걸 제가 손으로 강제로 켜줘야한다는게 말이 됩니까? Special thanks to
[@serialx](https://github.com/serialx)

```sh
# 켜기
sudo defaults write \
  /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true

# 끄기
sudo defaults delete \
  /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled

# Reference: https://www.tekrevue.com/tip/hidpi-mode-os-x/
```

<br>

### 키보드 세팅
[`Karabiner-Elements`]로 원하는걸 다 할수있었음.

1.  (터치바 없는 기종의 경우)
    <kbd>F7</kbd>, <kbd>F8</kbd>, <kbd>F9</kbd>키를 음악 재생 키 대신
    <kbd>F7</kbd>, <kbd>F8</kbd>, <kbd>F9</kbd>키로 사용함
1.  <kbd>Caps Lock</kbd> 키가 <kbd>Left ⌘</kbd>으로 작동하도록 설정
1.  <kbd>Left ⌘</kbd> 키가 <kbd>Right ⌘</kbd>으로 작동하도록 설정
1.  [iTerms2] 설정을 고쳐서, 터미널 내에선 <kbd>Left ⌘</kbd> 키가
    <kbd>Ctrl</kbd>키로 작동하도록 수정.
1.  <kbd>₩</kbd> 대신 <kbd>\`</kbd>가 입력되도록 수정한다. 아래 커맨드를 실행한
    뒤, 로그오프 후 다시 로그인 하면 반영된다.

    ```bash
    if ! [ -f ~/Library/KeyBindings/DefaultkeyBinding.dict ]; then
      mkdir -p ~/Library/KeyBindings &&\
        echo '{"₩" = ("insertText:", "\`");}' >\
          ~/Library/KeyBindings/DefaultkeyBinding.dict
    fi

    # Reference: https://gist.github.com/redism/43bc51cab62269fa97a220a7bb5e1103
    ```

[Monaco for powerline]: https://gist.github.com/simnalamburt/90965dcb09cec6b82320/raw/58a9f61143273d5226be352d2c29ecf738e5bffd/monaco-powerline.otf
[`Karabiner-Elements`]: https://github.com/tekezo/Karabiner-Elements
