서버/PC 관리 문서
========
도메인은 [GoDaddy]를 사용하여 구입하였고, 네임서버는 [CloudFlare]를 쓰고있다.

### 구독중인 메일링리스트
- [arch-announce](https://lists.archlinux.org/listinfo/arch-announce)
- [arch-security](https://lists.archlinux.org/listinfo/arch-security)
- [ubuntu-security-announce](https://lists.ubuntu.com/mailman/listinfo/ubuntu-security-announce)

### 서버 새로 세팅하면 해줄거
1.  [sshd_config에서 1024bit DHE 끄기](https://weakdh.org/sysadmin.html#openssh)

    ```sshd_config
    KexAlgorithms curve25519-sha256@libssh.org,diffie-hellman-group14-sha1
    ```

1.  sshd_config에서 패스워드 인증을 끄거나, [fail2ban] 설치

    ```sshd_config
    PasswordAuthentication no
    ```

1.  [nginx TLS 설정하기][https]. ([DHE 끄기](https://weakdh.org), SSLv3 끄기, 등)

1.  [HSTS] 강제하기

<br>

서버목록
--------

### A. 쿠마
개발/프로덕션용 서버.

항목 | 내용
-----|------
주소 | kuma.hyeon.me
OS   | Arch Linux
위치 | 춘천 IDC
하드웨어 | 일반 탑형 데스크톱
Mainboard | 인텔 DP35DP
CPU | Intel Core2 Quad Q6600 (quad core, 2.40 GHz)
RAM | DDR2 2GB×4
Storage | 128GB, SanDisk SD8SB8U1 (SSD)
VGA | GeForce GTS 240

### B. 도지
레거시 서버. 종료시킬 예정

항목 | 내용
-----|------
주소 | doge.hyeon.me
OS   | Ubuntu 14.04 LTS
위치 | 춘천 IDC
하드웨어 | 일반 탑형 데스크톱
Mainboard | ASUS P5KPL-C/1600
CPU | Intel Core2 Duo E7300 (dual core, 2.66 GHz)
RAM | DDR2 2GB×2
Storage | 320GB, 삼성 HD321KJ (HDD)
VGA | Radeon HD 3690/3850

[GoDaddy]: https://kr.godaddy.com/
[CloudFlare]: https://www.cloudflare.com/
[fail2ban]: https://github.com/fail2ban/fail2ban
[https]: https://github.com/simnalamburt/nginx.conf
[HSTS]: https://scotthelme.co.uk/setting-up-hsts-in-nginx
