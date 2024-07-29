macOS
========

### Basic configs
- Use English as main OS language
- Sign in AppleID
- Update OS to the latest version
- (Optional) Set wallpaper
- Sync desktop & documents directory with iCloud
- Enable FDE with FileVault
- Fastest key repeat rate, shortest delay until repeat
- Hide unnecessary items from sidebar of Finder, set home directory as a Finder's initial directory, show all filename extensions
- Organize launchpad; put all unused apps under a same directory
- Use a 24-hour clock on Lock Screen and menu bar
- Hide Siri from menu bar (if you have enabled Siri)
- Remap <kbd>⌘</kbd> + <kbd>Q</kbd> as a color revert key to prevent accidental process Quit
- (optional) 시스템설정 &rarr; 공유 &rarr; 원격 로그인 으로 ssh 서버 켬

### Homebrew
[Homebrew](https://brew.sh/) 설치

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

[brew 패키지들 설치](../packages/)

### Advanced configs
영어 키 꾹 누르면 키 반복되게 만들기

```bash
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```

Shift + Space 로 빠르게 한영 전환하기

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
- [Monaco Nerd Font 설치](https://drive.google.com/file/d/15o0ykWwg8tlfgo_fOfK5CD4I5FdLTXdt/view)
- [내 Karabiner-Elements 설정 import하기](https://genesy.github.io/karabiner-complex-rules-generator/#eyJ0aXRsZSI6InNpbW5hbGFtYnVydCIsInJ1bGVzIjpbeyJkZXNjcmlwdGlvbiI6InNpbW5hbGFtYnVydCIsIm1hbmlwdWxhdG9ycyI6W3sidHlwZSI6ImJhc2ljIiwiZnJvbSI6eyJrZXlfY29kZSI6ImNhcHNfbG9jayJ9LCJ0byI6W3sia2V5X2NvZGUiOiJyaWdodF9jb21tYW5kIiwicmVwZWF0Ijp0cnVlfV19XX1dfQo=)
- (optional) Wireguard 프로필 생성

### Terminal configs
- ed25519 키 생성해서 적재적소에 등록 (주로 깃헙과 개인서버들)
- 닷파일즈 클론
- iTerm2 설정 임포트, iTerm2에 엑세서빌리티 권한 부여
- ssh, vimrc, gitconfig, gitexclude 등의 설정들 심링크
- zinit, vim-plug 등 설치 후 플러그인 다운로드
- [git 커밋사인 설정](https://gist.github.com/simnalamburt/c921a9e70e9a43f5b4743499370d5a88)
