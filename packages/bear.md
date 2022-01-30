bear
========
Ubuntu 20.04 LTS, AArch64

### `apt`
- (removed) snapd screen bzip2 byobu
- wireguard-tools

PPA:

- docker-ce docker-ce-cli containerd.io (https://docs.docker.com/engine/install/ubuntu/)

&nbsp;

docs
--------
```bash
# Reload wireguard configs after updating /etc/wireguard/wg0.conf
sudo wg-quick strip /etc/wireguard/wg0.conf | sudo wg syncconf wg0 /dev/stdin

# IRC bot
docker run -d --restart=always \                            
  -e HYEONBOT_SERVER=irc.uriirc.org \                       
  -e HYEONBOT_PORT=16664 \                                  
  --mount type=bind,source=/home/ubuntu/hyeonbot,target=/a \
  ghcr.io/simnalamburt/hyeonbot:1.0.2

# discord-irc-rs
docker run -d --restart=always \                                                                                    
  --mount type=bind,source=/home/ubuntu/discord-irc-rs,target=/a \                                                  
  ghcr.io/simnalamburt/discord-irc-rs:latest@sha256:0be5025ed21258a0b7a10924eaa4999512b97bd87f8a5cc740ed8c20377e1efa

# fakeidentd
docker run -d --restart=always -p 113:113 ghcr.io/simnalamburt/fakeidentd:1.0.0
```
