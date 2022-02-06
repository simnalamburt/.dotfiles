M1 맥북에 yabai 설치하는법
========
> macOS 12.x.x 애플 실리콘 모델에만 적용되는 가이드임에 주의

Turn off your device, Press and hold the power button on your Mac until “Loading
startup options” appears. Click Options, then click Continue. In the menu bar,
choose Utilities, then Terminal.

```bash
# Disable System Integrity Protection except kext, dtrace, basesystem
csrutil disable --with kext --with dtrace --with basesystem
```

Reboot then run following command:

```bash
sudo nvram boot-args=-arm64e_preview_abi
```

Reboot then verify with following command:

```console
$ csrutil status
System Integrity Protection status: unknown (Custom Configuration).

Configuration:
	Apple Internal: disabled
	Kext Signing: enabled
	Filesystem Protections: disabled
	Debugging Restrictions: disabled
	DTrace Restrictions: enabled
	NVRAM Protections: disabled
	BaseSystem Verification: enabled
	Boot-arg Restrictions: disabled
	Kernel Integrity Protections: disabled
	Authenticated Root Requirement: enabled

This is an unsupported configuration, likely to break in the future and leave your machine in an unknown state.
```

Download <https://github.com/koekeishiya/yabai/files/7915231/yabai-v4.0.0.tar.gz>.
It's Pre-built version of [yabai@`91a42e74`](https://github.com/koekeishiya/yabai/commit/91a42e747197680330a4cd9c65f932a060b56e4e).

```bash
# Install scripting addition
sudo yabai --install-sa
# Load scripting addition
sudo yabai --load-sa
# Run yabai
./yabai
```

## Uninstall
Run following command:

```bash
# Stop yabai

# Uninstall the scripting addition
sudo yabai --uninstall-sa

# Remove yabai files
rm -rf /usr/local/var/log/yabai
rm ~/.yabairc
rm /tmp/yabai_$USER.lock
rm /tmp/yabai_$USER.socket
rm /tmp/yabai-sa_$USER.socket

# Unload the scripting addition by forcing a restart of Dock.app
killall Dock
```

Restore boot arguments:

```bash
sudo nvram boot-args=
```

Turn off your device, Press and hold the power button on your Mac until “Loading
startup options” appears. Click Options, then click Continue. In the menu bar,
choose Utilities, then Terminal.

```bash
# Completely enable SIP again
csrutil enable
```

###### References
- https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection
- https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(from-HEAD)
- https://github.com/koekeishiya/yabai/issues/1054
