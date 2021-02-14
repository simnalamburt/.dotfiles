서버/PC 관리 문서
========
Domain Registrar는 [Cloudflare Registrar]와 [Namecheap]을 쓰고있다. Name
server는 [Cloudflare]를 쓰고있다.

[Cloudflare Registrar]: https://www.cloudflare.com/products/registrar/
[Namecheap]: https://www.namecheap.com/
[Cloudflare]: https://www.cloudflare.com/

### 서버 세팅 주의사항
1.  sshd에서 비밀번호 인증은 꼭 끄고, 안 쓰는 사이퍼들도 모두 꺼주자.
    https://sshcheck.com 참고

    ```
    # Only Private Key Authn is allowed
    PasswordAuthentication no
    ChallengeResponseAuthentication no
    ```

    Put below to the `/etc/ssh/sshd_config` or `/etc/ssh/sshd_config.d/cipher.conf`.

    ```
    # See <https://sshcheck.com> and `ssh -Q [kex|key|mac]`
    KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org,diffie-hellman-group18-sha512,diffie-hellman-group16-sha512,diffie-hellman-group-exchange-sha256
    HostKeyAlgorithms ssh-ed25519,ssh-rsa,ssh-ed25519-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com
    MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com
    ```

1.  웹서버를 돌린다면 HTTP/2, TLS 1.3, HSTS, brotli 지원을 신경써주자.
    https://www.ssllabs.com/ssltest/ 참고

1.  가능하다면 DoH 사용을 고려해보자. <https://www.dnsleaktest.com>에서 DNS
    설정이 올바른지 검증할 수 있다

    ```bash
    sudo tee /etc/systemd/system/cloudflared-proxy-dns.service <<'EOF'
    # Reference: https://developers.cloudflare.com/1.1.1.1/dns-over-https/cloudflared-proxy
    [Unit]
    Description=DNS over HTTPS (DoH) proxy client
    Wants=network-online.target nss-lookup.target
    Before=nss-lookup.target

    [Service]
    AmbientCapabilities=CAP_NET_BIND_SERVICE
    CapabilityBoundingSet=CAP_NET_BIND_SERVICE
    DynamicUser=yes
    ExecStart=/usr/local/bin/cloudflared proxy-dns

    [Install]
    WantedBy=multi-user.target
    EOF

    # Stop using existing name resolver
    sudo systemctl disable --now systemd-resolved
    # Turn on cloudflared
    sudo systemctl enable --now cloudflared-proxy-dns
    # Fix cloudflared as name resolver
    sudo tee /etc/resolv.conf <<< 'nameserver 127.0.0.1'
    ```

    특히 Wireguard VPN server로 쓰는 서버일 경우 반드시 해야한다. 이 경우
    ExecStart의 인자로 `--address 0.0.0.0`를 넣어주면 Wireguard Client들도 DoH
    프록시를 함께 사용할 수 있다.


### 서버 운영할 때 구독하면 좋은 메일링리스트
- [x] [arch-announce](https://lists.archlinux.org/listinfo/arch-announce)
- [x] [arch-security](https://lists.archlinux.org/listinfo/arch-security)
- [ ] [ubuntu-security-announce](https://lists.ubuntu.com/mailman/listinfo/ubuntu-security-announce)
- [ ] [debian-security-announce](https://lists.debian.org/debian-security-announce/)
