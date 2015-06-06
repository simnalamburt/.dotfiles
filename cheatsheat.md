General               | 설명
----------------------|-----
`$ ag <query>`        | 파일들 사이에서 문자열 찾기
`$ find -name <name>` | 파일 이름으로 찾기
`$ sudo su`           | root로 로그인
`$ sudo -s`           | root로 변신
`$ du -hsc *`         | 디렉토리 크기 재기
`$ ls -lS`            | 디렉토리 내용 크기순 정렬

Shell | 설명
------|------
`^A`  | Home
`^E`  | End

[fzf][]      | 설명
-------------|--------
`Ctrl` + `r` | 자기가 쳤던 커맨드 fuzzy 탐색
`Ctrl` + `t` | 디렉토리 fuzzy 탐색

[fzf]: https://github.com/junegunn/fzf

apt-get                                       | 설명
----------------------------------------------|--------
`$ dpkg -l`                                   | 모든 데비안 패키지 보기
`$ dpkg --get-selections | grep -v deinstall` | 설치된 패키지들 보기
`# apt-get dist-upgrade`  | 패키지 업그레이드
`# apt-get --reinstall install <이름>`  | 패키지 재설치

[pacman][]                                 | 설명
-------------------------------------------|--------
`# pacman -S <name>`                       | 패키지 설치
`# pacman -R <name>`                       | 패키지 제거
`# pacman -Ss <name>`                      | 패키지 찾기
`# pacman -Qe`                             | List all explicitly installed packages
`# pacman -Sy`                             | Sync the database with the latest repository
`# pacman -Sy && pacman -S pacman-mirrors` | Update pacman mirrors
`# pacman -Syy`                            |
`# pacman -Syu`                            | 시스템 패키지 업데이트

[pacman]: https://wiki.archlinux.org/index.php/Pacman

rsync                   | 설명
------------------------|------
`rsync <src> <dest>`    | 이어받기가 지원되는 파일 다운로드
`rsync -P <src> <dest>` | 프로그레스 보기

서버 관리                   | 설명
----------------------------|--------
`# hostname <이름>`         | [서버 이름 바꾸기](http://askubuntu.com/a/87687)
`# ntpdate ntp.ubuntu.com`  | 서버 시간 동기화
`# reboot`                  | 서버 재시작
`# shutdown -P now`         | 서버 끄기
`# netstat -taupen`         | 어느 프로세스가 어느 소켓을 열고있는지 알아냄
`$ dpigs -S -H`             | 어느 패키지그룹의 용량이 큰지 보기
`$ dpigs -n 10`             | 용량 큰 패키지 10개 나열

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

유저관리                                | 설명
----------------------------------------|--------
`# adduser <username>`                  | 새 유저 만들기
`# adduser <username> sudo`             | 특정 사용자 sudoer로 설정
`# usermod -l <login-name> <old-name>`  | 유저 이름 바꾸기
`# usermod -m -d <path> <username>`     | 유저 홈디렉토리 바꾸기
`# usermod -g <group> <user>`           | 유저 primary group 바꾸기
`# usermod -aG sudo <username>`         | 특정 사용자 sudoer로 설정
`# vipw`                                | /etc/passwd  편집
`# vipw -s`                             | /etc/shadow  편집
`# pwck`                                | passwd, shadow 검증
`# vigr`                                | /etc/group   편집
`# vigr -s`                             | /etc/gshadow 편집
`# grpck`                               | group, gshadow 검증

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

gdb            | 설명
---------------|---
`run`, `r`     | 실행
`b <N>`        | N번 라인에 브레이크포인트
`i stacks`     | 스택트레이스 보기
`i locals`     | 현재 스택의 지역변수들
`i args`       | 현재 스택의 함수 인자들
`p <expr>`     | 해당 익스프레션 값 보기
`cont`         | 실행 재개
`layout split` | 소스랑 레지스터 보여주는 화면이 뜸
`disp/i $rip`  | 매 스텝마다 $rip 레지스터 값을 보여줌
`disp/x <addr>`| 매 스텝마다 addr 주소의 값을 보여줌
`i disp`       | 현재 걸려있는 disp들 나열
`d d <N>`      | N번째 display를 삭제

트레이스 | 설명
---------|------
`strace` |
`ltrace` |

valgrind                                          | 설명
--------------------------------------------------|-----
`valgrind --tool=memcheck --leak-check=yes ./bin` | 메모리릭, double-free 검사

lldb    | 설명
--------|--------
`help`  | 도움
`run`   | 실행

[tmux][]                    | 설명
----------------------------|--------
$ tmux new                  | 세션 생성
$ tmux ls                   | 세션 목록
$ tmux attach [-t <이름>]   | 세션에 attatch
^a d                        | 세션에서 detach
^a $                        | 세션 이름변경
^a c                        | 윈도우 생성
^a n                        | 다음 윈도우로 이동
^a p                        | 이전 윈도우로 이동
^a .                        | 윈도우 순서 변경
^a ,                        | 윈도우 이름 변경
^a \                        | 화면 종베기
^a -                        | 화면 횡베기
^a o                        | 다음 평면으로 이동
^a (h, j, k, l)             | 평면 크기조절
^a (H, J, K, L)             | 평면 크기 미세조절
^a <Space>                  | 평면 위치이동
^a :                        | 명령어창

[tmux]: http://nodeqa.com/nodejs_ref/99

FFmpeg                                          | 설명
------------------------------------------------|-------------
`$ ffmpeg -i <input> -vn -acodec copy <output>` | 오디오 추출
`$ ffmpeg -i <input> -vcodec copy -an <output>` | 비디오 추출

클립보드          | 설명
------------------|-------------
`$ pbcopy < file` | 파일의 내용을 복사
`$ pbpaste`       | 붙여넣기

iTerm2              | 설명
--------------------|---------------------------------
`⌘` + `alt` + drag  | block selection
`⌘` + `t`           | new tab
`⌘` + `T`           | show tab bar
`⌘` + `1`, `2`, ... | Go to tab 1, 2, ...
`⌘` + `-`, `\ `     | new pane (horizontal, virtical)
`⌘` + `[`, `]`      | Go next pane

[Mintty][]                  | 설명
----------------------------|------------------
`Ctrl`  + `Insert`          | GUI 복사
`Shirt` + `Insert`          | GUI 붙여넣기
`Alt` + `F2`                | 새 Mintty
`Alt` + `Enter`             | 전체화면
`Win` + `←`                 | 왼쪽 반
`Win` + `→`                 | 오른쪽 반
`Ctrl` + `Tab`              | Mintty 전환 (앞)
`Ctrl` + `Shift` + `Tab`    | Mintty 전환 (뒤)

[Mintty]: http://mintty.googlecode.com/svn-history/r1065/trunk/docs/mintty.1.html#20

### vim

Normal          | 설명
----------------|--------
ESC             | 다른 모드에서 일반 모드로 가기
^v              |
:w              | 저장하기
:q              | 나오기
:cq             | 저장하지 않고 나오기
:wq             | 저장과 동시에 나오기
:x              |
ZZ              |
:sh             | 새 shell 만들기
u               | Undo
Ctrl + r        | Redo
yy              | 한줄 복사
dd              | 한줄 잘라내기
P               | 앞에 붙여넣기
p               | 뒤에 붙여넣기
"_dd            | 한줄 지우기
:N              | N번째 라인으로 가기
:%s/old/new     | 치환 (문서의 맨 처음부터)
:%s/old/new/g   |
:%s/old/new/gc  |   (with prompt)
:,$s/old/new    | 치환 (현재 위치부터)
:nohlsearch     | 검색결과 하이라이트 끄기
:set paste      | 클립보드 모드 켜기
:set nopaste    |               끄기
:help           | 도움말
:help <keyword> |
f<char>         | 현재 라인에서 <char>로 순간이동
t<char>         |
:cd             | Change Directory
.               | Repeat last command

Insert / Replace | 설명
-----------------|--------
i                | Insert 모드로 들어가기
R                | Replace 모드로 들어가기

Visual    | 설명
----------|--------
v         | 비주얼      모드로 들어가기
V         | 비주얼 라인 모드로 들어가기
Ctrl + v  | 비주얼 블록 모드로 들어가기
y         | 복사
d         | 잘라내기
\>        | 인덴트 추가
\<        | 인덴트 제거
J         | 선택된 라인 전부 한줄로 붙이기

##### Per-line insertion

1.  `^v`
2.  Select
3.  `I` or `A`
4.  Insert
5.  `^[^[`

--------

### Check if reboot is required
```sh
if [ -f /var/run/reboot-required ]; then echo 'Restart required'; fi
```

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

### [Internet configuration](http://neoguru.tistory.com/56)

### Mibbit

https://widget.mibbit.com/?server=irc.uriirc.org:+16667&channel=%23hyeon
