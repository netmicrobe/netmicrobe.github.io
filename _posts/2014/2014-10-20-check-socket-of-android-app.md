---
layout: post
title: android 查看某个app的socket使用情况
description: 
categories: [android, cm]
tags: [android]
---


adb shell su -c "lsof" | grep egame | grep socket
