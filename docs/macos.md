macOS
========

### Basic configs
- AppleID 로그인
- OS 최신버전으로 업데이트
- 디스플레이 설정, 바탕화면 설정, OS 언어 설정
- iCloud로 어느어느 항목 공유할지 설정.
- FileVault로 Full Disk Encryption 수행
- 키 반복속도, 마우스 속도 설정
- Finder 사이드바, 초기 디렉토리 경로 변경, "모든 파일 확장자 보기"
- 알림창에서 주식칸 빼기
- 런치패드에서 안쓰는 기본앱들 전부 폴더 하나에 모음
- 시계 표시방식 변경
- 메뉴막대에서 시리 보이지 않도록 변경
- 색상 반전 키를 <kbd>⌘</kbd> + <kbd>Q</kbd> 로 리매핑해서 실수로 프로세스 종료하는것 막음.
- (optional) 시스템설정 &rarr; 공유 &rarr; 원격 로그인 으로 ssh 서버 켬

### Homebrew
[Homebrew](https://brew.sh/) 설치

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

[brew 패키지들 설치](../packages/)

### Advanced configs
한영키 설정

```bash
defaults export com.apple.symbolichotkeys - | plutil -convert json -o - - |
  jq '.AppleSymbolicHotKeys["61"].value.parameters[2] = 131072 | .AppleSymbolicHotKeys["60"].value.parameters[2] = 655360' |
  plutil -convert xml1 -o - - | defaults import com.apple.symbolichotkeys -
# 이후 컴퓨터 재로그인
```

Use `sudo` with TouchID

```bash
cat - /etc/pam.d/sudo <<< 'auth sufficient pam_tid.so' | sudo tee /etc/pam.d/sudo
```

### 3rd party software configs
- Rectangle 켜고 권한 주기
- [파이어폭스 설정](firefox.md)
- 직접 만든 Monaco Nerd Font 설치 (구글 드라이브에 있음)
- [내 Karabiner-Elements 설정 import하기](https://genesy.github.io/karabiner-complex-rules-generator/#eyJ0aXRsZSI6InNpbW5hbGFtYnVydCIsInJ1bGVzIjpbeyJkZXNjcmlwdGlvbiI6InNpbW5hbGFtYnVydCIsIm1hbmlwdWxhdG9ycyI6W3sidHlwZSI6ImJhc2ljIiwiZnJvbSI6eyJrZXlfY29kZSI6ImNhcHNfbG9jayJ9LCJ0byI6W3sia2V5X2NvZGUiOiJyaWdodF9jb21tYW5kIiwicmVwZWF0Ijp0cnVlfV19XX1dfQo=)
- (optional) Wireguard 프로필 생성

### Terminal configs
- ed25519 키 생성해서 적재적소에 등록 (주로 깃헙과 개인서버들)
- 닷파일즈 클론
- iTerm2 설정 임포트, iTerm2에 엑세서빌리티 권한 부여
- ssh, vimrc, gitconfig, gitexclude 등의 설정들 심링크
- zinit, vim-plug 등 설치 후 플러그인 다운로드
- [git 커밋사인 설정](https://gist.github.com/simnalamburt/c921a9e70e9a43f5b4743499370d5a88)
