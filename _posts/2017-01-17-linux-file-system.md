---
layout: post
title: "Linux file system"
description: "General structure and details about Linux file system"
tags: [linux]
---

General structure of Lunux filesystem.

{% include image.html path="03_linux_filesystem/linux-filesystem.png" path-detail="03_linux_filesystem/linux-filesystem.png" alt="Linux filesystem structure" %}

  - `/bin` - binaries, place where all programs live (or most of them)
  - `/boot` - binaries for machine booting. Also **bootloader** also here
  - `/cdrom` - old folder. Access to CD-ROM device if it exists. Left for compatibility
  - `/dev` - all devices at computer represented here
  - `/etc` - all system configuration
  - `/home` - usually contains all hard drives mounted to the system. Also contains specific user folders with parameters for each user
  - `/lib`, `/lib64` - libraries for programs
  - `/media` - contains mounted USB drives by default
  - `/opt` - some programs store here theirs folders. Or software can be installed here by default
  - `/tmp` - programs can save there temporary files. Usually this directory cleaned up after rebooting.
  - `/var` - a lot of logs
  - `/sbin` - **source binaries**, usually binary sources live here
  - `/root` - root user home directory
  - `/usr` - **universal system resources** - icons, fonts and any kind of system resources live here.