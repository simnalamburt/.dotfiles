macOS
========

### Setup
1.  Apple ID 로그인
2.  OS 최신버전으로 업데이트
3.  기본 설정들
    - 디스플레이 설정, 바탕화면 설정, 유저 프로필 사진 설정, OS 언어 설정
    - iCloud로 어느어느 항목 공유할지 설정. 데스크톱, 문서, 사진, 이메일은 공유 안하도록 함.
    - FileVault로 Full Disk Encryption 수행
    - 트랙패드/마우스 터치옵션 설정
    - 키 반복속도, 마우스 속도 설정
    - Finder 사이드바, 초기 디렉토리 경로 변경, "모든 파일 확장자 보기"
    - 알림창에서 주식칸 빼기
    - 런치패드에서 안쓰는 기본앱들 전부 폴더 하나에 모음
    - 시계 표시방식 변경
    - 메뉴막대에서 IME, 시리 보이지 않도록 변경
    - 시스템설정 &rarr; 공유 &rarr; 원격 로그인 으로 ssh 서버 켬
    - 색상 반전 키를 <kbd>⌘</kbd> + <kbd>Q</kbd> 로 리매핑해서 실수로 프로세스 종료하는것 막음.
5.  Homebrew 설치
6.  brew 패키지들 설치
7.  소프트웨어 설치 후 설정들
    - [파이어폭스 설정](firefox.md)
    - ed25519 키 생성해서 적재적소에 등록 (주로 깃헙과 개인서버들)
    - 닷파일즈 클론
    - 직접 만든 Monaco Nerd Font 설치 (구글 드라이브에 있음)
    - iTerm2 설정 임포트, iTerm2에 엑세서빌리티 권한 부여
    - ssh, vimrc, gitconfig, gitexclude 등의 설정들 심링크
    - zinit, vim-plug 등 설치 후 플러그인 다운로드
    - [git 커밋사인 설정](https://gist.github.com/simnalamburt/c921a9e70e9a43f5b4743499370d5a88)
    - (optional) Wireguard 프로필 생성
8.  Karabiner-Elements
    - Caps Lock → Left Command
    - Left Command → Right Command,
    - [capslock to IME](https://genesy.github.io/karabiner-complex-rules-generator/#eyJ0aXRsZSI6InNpbW5hbGFtYnVydCIsInJ1bGVzIjpbeyJkZXNjcmlwdGlvbiI6ImNhcHNsb2NrIHRvIElNRSIsIm1hbmlwdWxhdG9ycyI6W3sidHlwZSI6ImJhc2ljIiwiZnJvbSI6eyJrZXlfY29kZSI6ImNhcHNfbG9jayJ9LCJ0byI6W3sic2VsZWN0X2lucHV0X3NvdXJjZSI6eyJpbnB1dF9zb3VyY2VfaWQiOiJeY29tXFwuYXBwbGVcXC5pbnB1dG1ldGhvZFxcLktvcmVhblxcLjJTZXRLb3JlYW4kIn19XSwiY29uZGl0aW9ucyI6W3sidHlwZSI6ImlucHV0X3NvdXJjZV9pZiIsImlucHV0X3NvdXJjZXMiOlt7ImlucHV0X3NvdXJjZV9pZCI6Il5jb21cXC5hcHBsZVxcLmtleWxheW91dFxcLkFCQyQifV19XX0seyJ0eXBlIjoiYmFzaWMiLCJmcm9tIjp7ImtleV9jb2RlIjoiY2Fwc19sb2NrIn0sInRvIjpbeyJzZWxlY3RfaW5wdXRfc291cmNlIjp7ImlucHV0X3NvdXJjZV9pZCI6Il5jb21cXC5hcHBsZVxcLmtleWxheW91dFxcLkFCQyQifX1dLCJjb25kaXRpb25zIjpbeyJ0eXBlIjoiaW5wdXRfc291cmNlX2lmIiwiaW5wdXRfc291cmNlcyI6W3siaW5wdXRfc291cmNlX2lkIjoiXmNvbVxcLmFwcGxlXFwuaW5wdXRtZXRob2RcXC5Lb3JlYW5cXC4yU2V0S29yZWFuJCJ9XX1dfV19XX0=)
    - [cmd + tab to ctrl + tab](https://genesy.github.io/karabiner-complex-rules-generator/#eyJ0aXRsZSI6InNpbW5hbGFtYnVydCIsInJ1bGVzIjpbeyJkZXNjcmlwdGlvbiI6ImNtZCt0YWIgdG8gY3RybCt0YWIiLCJtYW5pcHVsYXRvcnMiOlt7InR5cGUiOiJiYXNpYyIsImZyb20iOnsibW9kaWZpZXJzIjp7Im1hbmRhdG9yeSI6WyJjb21tYW5kIl19LCJrZXlfY29kZSI6InRhYiJ9LCJ0byI6W3sicmVwZWF0Ijp0cnVlLCJrZXlfY29kZSI6InRhYiIsIm1vZGlmaWVycyI6WyJyaWdodF9jb250cm9sIl19XX1dfV19)

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
