---
layout: post
title: adb install 报错 INSTALL_FAILED_VERSION_DOWNGRADE
description: 
categories: [android, cm]
tags: [android, adb]
---


adb install -r eGame_TP_VER_7.0.3ctch1_20140310_1.apk

adb install 报错 INSTALL_FAILED_VERSION_DOWNGRADE，低版本不能覆盖安装

新的adb工具有此限制，使用 -d 参数忽略这个问题；

adb install -r -d eGame_TP_VER_7.0.3ctch1_20140310_1.apk