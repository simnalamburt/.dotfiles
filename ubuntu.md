Ubuntu
========

리눅스 | 설명
-------|-----
`$ ag <query>`        | 파일들 사이에서 문자열 찾기
`$ find -name <name>` | 파일 이름으로 찾기
`$ sudo su`           | root로 로그인
`$ sudo -s`           | root로 변신
`$ du -hsc *`         | 디렉토리 크기 재기
`$ ls -lS`            | 디렉토리 내용 크기순 정렬

[fzf][]      | 설명
-------------|--------
`Ctrl` + `r` | 자기가 쳤던 커맨드 fuzzy 탐색
`Ctrl` + `t` | 디렉토리 fuzzy 탐색

[fzf]: https://github.com/junegunn/fzf

서버 관리                   | 설명
----------------------------|--------
`# hostname <이름>`         | [서버 이름 바꾸기](http://askubuntu.com/a/87687)
`# ntpdate ntp.ubuntu.com`  | 서버 시간 동기화
`# reboot`                  | 서버 재시작
`# shutdown -P now`         | 서버 끄기

서버 모니터링       | 설명
--------------------|--------
`$ w`               | 로그인된 유저 보기
`$ who`             | 로그인된 유저 보기
`$ htop`            | CPU 사용량 모니터링
`$ iotop`           | Disk IO 모니터링
`$ iftop`           | Networking 모니터링
`$ ps -ef`          | 프로세스 보기 (모든 프로세스)
`$ ps -u <uid>`     | 특정 UID의 프로세스 보기
`$ ps aux | ag 'Z'` | 모든 좀비 프로세스 보기
`$ kill <pid>`      | 프로세스 죽이기
`$ kill -0 <pid>`   | 프로세스 죽이기 (Successfully Exited)
`$ kill -9 <pid>`   | 프로세스 죽이기 (Killed)

apt-get                                       | 설명
----------------------------------------------|--------
`$ dpkg -l`                                   | 모든 데비안 패키지 보기
`$ dpkg --get-selections | grep -v deinstall` | 설치된 패키지들 보기
`# apt-get dist-upgrade`  | 패키지 업그레이드
`# apt-get --reinstall install <이름>`  | 패키지 재설치

유저관리                        | 설명
--------------------------------|--------
`# adduser <username> sudo`     | 특정 사용자 sudoer로 설정
`# usermod -aG sudo <username>` | 특정 사용자 sudoer로 설정
`# vipw`                        | /etc/passwd  편집
`# vipw -s`                     | /etc/shadow  편집
`# pwck`                        | passwd, shadow 검증
`# vigr`                        | /etc/group   편집
`# vigr -s`                     | /etc/gshadow 편집
`# grpck`                       | group, gshadow 검증

네트워크                  | 설명
--------------------------|--------
`$ nc -z <domain> <port>` | 포트 열려있는지 확인하기
`$ time -v <command>`     | 프로세스 실행시간 비교하기
`$ ssh -D8000 hyeon.me`   | ssh 터널링 (dynamic)

압축                                  | 설명
--------------------------------------|--------
`$ tar  -cvf <이름> <A> <B> <C> ...`  | `tar` 만들기
`$ tar  -xvf <이름>`                  | `tar` 풀기
`$ tar   -tf <이름>`                  | `tar` 열어보기
`$ gzip <option> <file>`              | `gz`
`$ xz <option> <file>`                | `xz`
`$ tar -zcvf <이름> <A> <B> <C> ...`  | 한번에 `tar.gz` 만들기
`$ tar -Jcvf <이름> <A> <B> <C> ...`  | 한번에 `tar.xz` 만들기

lldb    | 설명
--------|--------
`help`  | 도움
`run`   | 실행

### Configure power button action

```
# /etc/systemd/login.conf
HandlePowerKey=ignore
HandleSuspendKey=ignore
HandleHibernateKey=ignore
HandleLidSwitch=ignore
```

```sh
sudo restart systemd-logind
```

### Customize message of the day

Go `/etc/update-motd.d/`

### tmux
[tmux 입문 가이드](http://nodeqa.com/nodejs_ref/99)
```
세션 생성                     $ tmux new
세션 목록                     $ tmux ls
세션에 attatch                $ tmux attach [-t <이름>]
세션에서 detach                 ^b d
세션 이름변경                   ^b $

윈도우 생성                     ^b c
다음 윈도우로 이동              ^b n
이전 윈도우로 이동              ^b p
윈도우 순서 변경                ^b .
윈도우 이름 변경                ^b ,

화면 종베기                     ^b \
화면 횡베기                     ^b -
다음 평면으로 이동              ^b o
평면 크기조절                   ^b (h, j, k, l)
평면 크기 미세조절              ^b (H, J, K, L)
평면 위치이동                   ^b <Space>

명령어창                        ^b :
```

### vim

##### 일반모드

```
다른 모드에서 일반 모드로 가기          ESC
                                        ^v

저장하기                               :w
나오기                                 :q
저장하지 않고 나오기                   :cq
저장과 동시에 나오기                   :wq
                                       :x
                                        ZZ

새 shell 만들기                        :sh

Undo                                    u
Redo                                    Ctrl + r

한줄 복사                               yy
한줄 잘라내기                           dd
앞에 붙여넣기                           P
뒤에 붙여넣기                           p

한줄 지우기                             "_dd

N번째 라인으로 가기                    :N

치환 (문서의 맨 처음부터)              :%s/old/new
                                       :%s/old/new/g
  (with prompt)                        :%s/old/new/gc

치환 (현재 위치부터)                   :,$s/old/new

검색결과 하이라이트 끄기               :nohlsearch
클립보드 모드 켜기                     :set paste
              끄기                     :set nopaste

도움말                                 :help
                                       :help <keyword>

현재 라인에서 <char>로 순간이동         f<char>
                                        t<char>
```

##### 편집 모드

```
Insert 모드로 들어가기                  i
Replace 모드로 들어가기                 R
```

##### 비주얼 모드

```
비주얼      모드로 들어가기             v
비주얼 라인 모드로 들어가기             V
비주얼 블록 모드로 들어가기             Ctrl + v

복사                                    y
잘라내기                                d
인덴트 추가                             >
인덴트 제거                             <

선택된 라인 전부 한줄로 붙이기          J
```

##### 고급

```
Per-line insertion                   1. Ctrl + v
                                     2. 수정할곳 선택
                                     3. I or A
                                     4. 편집
                                     5. ESC
```


-----

### IP 주소 옮기면 제일 처음 할일
1. goDaddy.com DNS 에디터에서 IP주소 바꾸기

### 우분투 인터넷 설정하기
1. http://neoguru.tistory.com/56

--------

### apt

* vim-nox
* git, zsh (oh-my-zsh)
* tmux
* weechat
* nginx
* htop, fail2ban
* python, python-dev, python-pip
  * pysha3
* postfix
  * `v=spf1 a mx ptr ptr:175.197.17.221 -all`

### PPA

1.  mongodb
1.  [nodejs](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions)
1.  [ruby2.1, ruby2.1-dev](https://www.brightbox.com/docs/ruby/ubuntu/)

### [gitlab](https://github.com/gitlabhq/gitlabhq/blob/master/doc/install/installation.md)
