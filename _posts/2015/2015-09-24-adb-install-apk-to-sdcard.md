---
layout: post
title: 安装apk到sd卡中的 adb 命令
date: 2015-09-24
description: 
categories: [android, cm]
tags: [adb, android, cm]
---

安装到sd卡中

```shell
adb devices
adb shell pm set-install-location 2   //[0/auto] [1/internal] [2/external]
adb install test.apk
```

