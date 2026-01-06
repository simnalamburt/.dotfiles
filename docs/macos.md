macOS
========

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

```bash
# homebrew 설치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew 패키지 설치. packages/mbp.md 참고

# 영어 키 꾹 누르면 키 반복되게 만들기
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# 한글에서 원화기호(₩) 대신 backtick(\) 입력되게 만들기
set -C
mkdir -p ~/Library/KeyBindings
echo '{"₩"=("insertText:", "\`");}'>~/Library/KeyBindings/DefaultkeyBinding.dict

# Shift + Space 로 빠르게 한영 전환하기 (재로그인 필요)
defaults export com.apple.symbolichotkeys - | plutil -convert json -o - - |
  jq '.AppleSymbolicHotKeys["61"].value.parameters[2] = 131072 | .AppleSymbolicHotKeys["60"].value.parameters[2] = 655360' |
  plutil -convert xml1 -o - - | defaults import com.apple.symbolichotkeys -

# Use sudo with TouchID
cat <<< 'auth sufficient pam_tid.so' | sudo tee -a /etc/pam.d/sudo_local
```

- [브라우저 설정](browser.md)
- [Monaco Nerd Font 설치](https://github.com/thep0y/monaco-nerd-font)
- (optional) Wireguard 프로필 생성
- Secretive로 ecdsa-sha2-nistp256 키 생성해서 적재적소에 등록 (주로 깃헙과 개인서버들)
- .dotfiles 클론
- wezterm, karabiner, ssh, vimrc, gitconfig, gitexclude 등의 설정들 심링크
- zinit, vim-plug 등 설치 후 플러그인 다운로드
- (optional) Secretive로 새 age private key 생성
