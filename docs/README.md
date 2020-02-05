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
