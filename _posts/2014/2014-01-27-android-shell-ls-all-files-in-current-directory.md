---
layout: post
title: android shell ls all files in current directory
description: 
categories: [android, cm]
tags: [android, adb]
---

adb shell 不支持find，使用如下命令：

adb shell ls -R /


