깃 커밋 서명하는법
========
> **NOTE**: Consider using an SSH key to sign commits instead of GPG. It's much easier and simpler.

### A. PGP key pair 등록
기존에 원래 사용하던 PGP key pair가 없을경우 새로 만들어야한다. 이미 key pair가 있을경우, 비밀키를 컴퓨터에 다운로드 해줘야한다.

#### A.1. 새 키 만드는법[^1]

```console
$ gpg --generate-key
Real name: Hyeon Kim
Email address: simnalamburt@gmail.com
You selected this USER-ID:
    "Hyeon Kim <simnalamburt@gmail.com>"

Change (N)ame, (E)mail, or (O)kay/(Q)uit? O

# 새 키가 만들어진것을 확인할 수 있음, "A99733D72EF87C242A91C64BDCB9A7B38703A59B" 부분이 키 아이디임.
$ gpg --list-secret-keys
sec   ed25519 2022-07-04 [SC] [expires: 2024-07-03]
      A99733D72EF87C242A91C64BDCB9A7B38703A59B
uid           [ultimate] Hyeon Kim <simnalamburt@gmail.com>
ssb   cv25519 2022-07-04 [E] [expires: 2024-07-03]
```

#### A.2. 기존 키로 하는법
```console
# 기존에 만들어뒀던 비밀키를 컴퓨터에 다운받은 뒤 아래 커맨드 실행
$ gpg --import private.key

# 키가 import된것을 확인할 수 있음, "A99733D72EF87C242A91C64BDCB9A7B38703A59B" 부분이 키 아이디임.
$ gpg --list-secret-keys
sec   ed25519 2022-07-04 [SC] [expires: 2024-07-03]
      A99733D72EF87C242A91C64BDCB9A7B38703A59B
uid           [ unknown] Hyeon Kim <simnalamburt@gmail.com>
ssb   cv25519 2022-07-04 [E] [expires: 2024-07-03]

# 다운받은 키여서 신뢰 레벨을 올려주는 절차가 필요함
$ gpg --edit-key A99733D72EF87C242A91C64BDCB9A7B38703A59B
gpg> trust
Your decision? 5
Do you really want to set this key to ultimate trust? (y/N) y
gpg> save
```

&nbsp;

### B. `~/.gitconfig` 수정
```
[commit]
	gpgsign = true
[user]
	signingkey = A99733D72EF87C242A91C64BDCB9A7B38703A59B
```

[^1]: 옛날에는 [keybase.io](https://keybase.io)로 관리하는걸 추천했었는데, 회사가 zoom에 팔리고나서 뭔가 뭔가 미래가 불투명해진것같아 요즘은 일부러 추천하진 않고있음.
