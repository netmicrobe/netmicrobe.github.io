---
layout: post
title: 64位Ubuntu 上运行adb报错 error while loading shared libraries  libncurses.so.5
description: 
categories: [android, cm]
tags: [android, adb, ubuntu]
---

原因：

    32位的SDK，需要安装对应的32位shared lib。

解决：

安装对应的32位lib

sudo apt-get install libncurses5:i386