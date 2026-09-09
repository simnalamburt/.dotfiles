bear
========
Debian GNU/Linux 13 (trixie), AArch64

### `apt`
- (removed) screen vim vim-tiny nano
- neovim fzf htop
- wireguard-tools nftables
- caddy

### Manual configs
```bash
#
# Enable fzf
#
cat >> ~/.bashrc <<'EOF'

# fzf
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash
EOF


#
# generate en_US.UTF-8 locale
#
sudo sed -i 's/^# en_US\.UTF-8 UTF-8$/en_US.UTF-8 UTF-8/' /etc/locale.gen
sudo locale-gen


#
# Setup DNS-over-TLS
#
sudo mkdir -p /etc/systemd/resolved.conf.d
sudo tee /etc/systemd/resolved.conf.d/cloudflare-dot.conf <<'EOF'
[Resolve]
DNS=1.1.1.1#cloudflare-dns.com 1.0.0.1#cloudflare-dns.com 2606:4700:4700::1111#cloudflare-dns.com 2606:4700:4700::1001#cloudflare-dns.com
DNSOverTLS=yes
Domains=~.
DNSStubListenerExtra=10.200.200.1
EOF
sudo systemctl restart systemd-resolved
# Check
ls -l /etc/resolv.conf
resolvectl status
resolvectl query bear.hyeon.me
ss -tulpn | grep ':53\>'


#
# Setup WireGuard
#
# Enable net.ipv4.ip_forward
sudo tee /etc/sysctl.d/99-wireguard.conf <<< 'net.ipv4.ip_forward = 1'
sudo sysctl --system
# Manually create .netdev
sudo install -m 640 -o root -g systemd-network /dev/null /etc/systemd/network/50-wg0.netdev
sudo nvim /etc/systemd/network/50-wg0.netdev
# [NetDev]
# Name=wg0
# Kind=wireguard
#
# [WireGuard]
# PrivateKey=********************************************
# ListenPort=51820
# RouteTable=main
#
# # Peer 1
# [WireGuardPeer]
# PublicKey=********************************************
# PresharedKey=********************************************
# AllowedIPs=10.200.200.2/32
#
# # Peer 2
# [WireGuardPeer]
# PublicKey=********************************************
# PresharedKey=********************************************
# AllowedIPs=10.200.200.3/32
#
# # And so on...
# Create .network
sudo tee /etc/systemd/network/50-wg0.network <<'EOF'
[Match]
Name=wg0

[Network]
Address=10.200.200.1/24
EOF
# Setup nftables
sudo tee /etc/nftables.conf <<'EOF'
#!/usr/sbin/nft -f
flush ruleset # NOTE: This line might conflict with softwares like Docker
table ip nat {
	chain postrouting {
		type nat hook postrouting priority srcnat; policy accept;
		ip saddr 10.200.200.0/24 oifname != "wg0" masquerade
	}
}
EOF
# Start
sudo systemctl enable --now nftables
sudo networkctl reload
# Check
networkctl status wg0
sudo wg show
sudo nft list ruleset
/sbin/sysctl net.ipv4.ip_forward
sudo ss -ulnp 'sport = :53'
# If you update /etc/systemd/network/50-wg0.netdev, run `sudo networkctl reload`

#
# Setup Caddy
#
sudo install -d -o admin -g admin /srv/bear.hyeon.me
curl -L 'https://raw.githubusercontent.com/simnalamburt/bear.hyeon.me/refs/heads/main/index.html' -o /srv/bear.hyeon.me/index.html
(cd /srv/bear.hyeon.me && brotli -kf index.html && zstd -kfq -19 index.html && gzip -kf -9 index.html)
sudo tee /etc/caddy/Caddyfile <<'EOF'
bear.hyeon.me
root * /srv/bear.hyeon.me
file_server {
        precompressed br zstd gzip
}
EOF
sudo systemctl reload caddy

#
# Setup discord-irc-rs
#
mkdir -p ~/discord-irc-rs
# Manually prepare ~/discord-irc-rs/config.toml
curl -L 'https://github.com/pbzweihander/discord-irc-rs/releases/download/v1.0.3/discord-irc-1.0.3-aarch64-unknown-linux-musl' -o ~/discord-irc-rs/discord-irc
chmod +x ~/discord-irc-rs/discord-irc
sudo tee /etc/systemd/system/discord-irc-rs.service <<'EOF'
[Unit]
Description=Discord to IRC bridge bot
After=network-online.target
Wants=network-online.target

[Service]
User=admin
ExecStart=/home/admin/discord-irc-rs/discord-irc /home/admin/discord-irc-rs/config.toml
Environment=RUST_LOG=info
Restart=always
RestartSec=5

NoNewPrivileges=yes
PrivateTmp=yes
ProtectSystem=strict
ProtectHome=read-only

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable --now discord-irc-rs
systemctl status discord-irc-rs

#
# Setup hyeonbot
#
mkdir -p ~/hyeonbot
# Manually prepare ~/hyeonbot/config.toml and ~/hyeonbot/db
curl -L 'https://github.com/simnalamburt/hyeonbot/releases/download/v2.0.0/hyeonbot-2.0.0-aarch64-unknown-linux-musl' -o ~/hyeonbot/hyeonbot
chmod +x ~/hyeonbot/hyeonbot
sudo tee /etc/systemd/system/hyeonbot.service <<'EOF'
[Unit]
Description=Personal IRC bot
After=network-online.target
Wants=network-online.target

[Service]
User=admin
WorkingDirectory=/home/admin/hyeonbot
ExecStart=/home/admin/hyeonbot/hyeonbot
Restart=always
RestartSec=5

NoNewPrivileges=yes
PrivateTmp=yes
ProtectSystem=strict
ProtectHome=read-only
ReadWritePaths=/home/admin/hyeonbot

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable --now hyeonbot
systemctl status hyeonbot
```
