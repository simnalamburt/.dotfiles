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

    ```sshd_config
    # Only Private Key Authn is allowed
    PasswordAuthentication no
    ChallengeResponseAuthentication no

    # We want the PAM account and session checks to run without PAM authentication
    UsePAM yes
    PrintMotd no

    # Everyone loves SFTP
    Subsystem sftp /usr/lib/openssh/sftp-server

    # See <https://sshcheck.com> and `ssh -Q [kex|key|mac]`
    KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org,diffie-hellman-group18-sha512,diffie-hellman-group16-sha512,diffie-hellman-group-exchange-sha256
    HostKeyAlgorithms ssh-ed25519,ssh-rsa,ssh-ed25519-cert-v01@openssh.com,ssh-rsa-cert-v01@openssh.com
    MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com
    ```

1.  웹서버를 돌린다면 HTTP/2, TLS 1.3, HSTS, brotli 지원을 신경써주자.
    https://www.ssllabs.com/ssltest/ 참고

### 서버 운영할 때 구독하면 좋은 메일링리스트
- [arch-announce](https://lists.archlinux.org/listinfo/arch-announce)
- [arch-security](https://lists.archlinux.org/listinfo/arch-security)
- [ubuntu-security-announce](https://lists.ubuntu.com/mailman/listinfo/ubuntu-security-announce)
