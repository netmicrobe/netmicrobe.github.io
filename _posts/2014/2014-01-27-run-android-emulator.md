---
layout: post
title: 运行 Android Emulator
description: 
categories: [android, cm]
tags: [android, emulator]
---


## 启动

emulator -avd <avd_name>[<options>]

> 查看有哪些可用avd

> > android list avd

> 使用emulator命令启动

> > emulator -avd WVGA-4.2 -sdcard /home/ethan/sdk/android/sd64m.img -scale 0.8

## 帮助

emulator -help