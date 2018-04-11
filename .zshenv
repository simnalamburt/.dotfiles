# brew로 mosh를 설치한 macOS 서버로 mosh를 하려면, 서버의 `~/.zshenv`에 아래와
# 같은 설정이 있으면 좋다.
#
# Reference:
#   https://github.com/mobile-shell/mosh/issues/102#issuecomment-292260840

export PATH=/usr/local/bin:$PATH
