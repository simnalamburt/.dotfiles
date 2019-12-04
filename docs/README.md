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

[GoDaddy]: https://kr.godaddy.com/
[CloudFlare]: https://www.cloudflare.com/
[fail2ban]: https://github.com/fail2ban/fail2ban
[https]: https://github.com/simnalamburt/nginx.conf
[HSTS]: https://scotthelme.co.uk/setting-up-hsts-in-nginx

<br>

서버목록
--------

### A. kuma.hyeon.me

항목      | 내용
----------|------
CPU       | [Intel Core2 Quad Q6600 (quad core, 2.40 GHz)](https://ark.intel.com/content/www/kr/ko/ark/products/29765/intel-core-2-quad-processor-q6600-8m-cache-2-40-ghz-1066-mhz-fsb.html)
Mainboard | [Intel DP35DP](https://www.cnet.com/products/intel-desktop-board-dp35dp-media-series-motherboard-atx-lga775-socket-p35-series/)
Socket    | LGA775
OS        | Arch Linux
케이스    | COX A3 노빌레 풀아크릴윈도우 with 헤일로X4 블랙
파워      | SuperFlower SF-500R14SE Silver Green FX
RAM       | DDR2 2GB×4
Storage   | 128GB, SanDisk SD8SB8U1 (SSD)

### B. doge

항목      | 내용
----------|------
CPU       | [Intel Core2 Duo E7300 (dual core, 2.66 GHz)](https://ark.intel.com/content/www/kr/ko/ark/products/36463/intel-core-2-duo-processor-e7300-3m-cache-2-66-ghz-1066-mhz-fsb.html)
Mainboard | [ASUS P5KPL-C/1600](https://www.cnet.com/products/asus-p5kpl-c-1600-motherboard-atx-lga775-socket-g31/)
Socket    | LGA775
OS        | Arch Linux
케이스    | 불명 (일반 탑형 데스크톱)
파워      | topower TOP-500D 80PLUS Bronze
RAM       | DDR2 2GB×2
Storage   | 320GB, Western Digital WD3200BPVT (HDD, 2011-01-07)

### C. 구 UPNL 클라이언트

항목      | 내용
----------|------
CPU       | [Intel Pentium D 945 (2코어, 3.40GHz)](https://ark.intel.com/content/www/kr/ko/ark/products/27520/intel-pentium-d-processor-945-4m-cache-3-40-ghz-800-mhz-fsb.html)
Mainboard | [MSI MS-7173 RC410M](https://www.cnet.com/products/msi-rc410m-l-motherboard-micro-atx-lga775-socket-radeon-xpress-200-series/)
Socket    | PLGA775
OS        | 불명
케이스    | [(주)브라보텍 스텔스 EX270 파노라마 윈도우 블랙](http://bravotec.co.kr/shop/item.php?it_id=1520313864)
파워      | 스카이디지탈 파워스테이션2 PS2-450EF 80PLUS
RAM       | DDR2 1GBx2
Storage   | 320GB, 삼성 HD321KJ (HDD)

<br>

그 외 재고들
--------

1.  [NVIDIA GeForce 9500 GT](https://www.geforce.com/hardware/desktop-gpus/geforce-9500-gt/specifications)
2.  [NVIDIA GeForce GTS 240](https://www.geforce.com/hardware/desktop-gpus/geforce-gts-240-oem-product/specifications)
3.  Radeon HD 3850
4.  [AMD Radeon R7 360](https://www.gigabyte.com/Graphics-Card/GV-R736OC-2GD-rev-10#kf) (춘천에 있음)
5.  [NVIDIA GeForce GTX 970](https://www.nvidia.com/en-us/geforce/900-series/#specsmodal-970) (사용중)
