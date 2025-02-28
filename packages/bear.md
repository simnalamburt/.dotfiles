bear
========
Ubuntu 20.04 LTS, AArch64

### `apt`
- (removed) snapd screen bzip2 byobu vim vim-tiny nano
- neovim fzf
- wireguard-tools

PPA:

- docker-ce docker-ce-cli containerd.io (https://docs.docker.com/engine/install/ubuntu/)
- cloudflared (https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation)
- caddy (https://caddyserver.com/docs/install#debian-ubuntu-raspbian)

&nbsp;

docs
--------
```bash
# systemd-resolved was replaced with cloudflared-proxy-dns
# See /etc/systemd/system/cloudflared-proxy-dns.service
sudo systemctl disable --now systemd-resolved
sudo systemctl enable --now cloudflared-proxy-dns

# Reload wireguard configs after updating /etc/wireguard/wg0.conf
sudo wg-quick strip /etc/wireguard/wg0.conf | sudo wg syncconf wg0 /dev/stdin

# IRC bot
sudo docker run -d --restart=always \
  -e HYEONBOT_SERVER=irc.uriirc.org \
  -e HYEONBOT_PORT=16664 \
  --mount type=bind,src=/home/ubuntu/hyeonbot,dst=/a \
  ghcr.io/simnalamburt/hyeonbot:1.0.5

# discord-irc-rs
sudo docker run -d --restart=always \
  --mount type=bind,src=/home/ubuntu/discord-irc-rs,dst=/a \
  ghcr.io/pbzweihander/discord-irc-rs:1.0.1

# personal-op-bot
sudo docker run -d --restart=always \
  --mount type=bind,src=/home/ubuntu/personal-op-bot,dst=/a \
  ghcr.io/simnalamburt/personal-op-bot:1.0.2
```
