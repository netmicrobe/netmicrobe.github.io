---
layout: post
title: dump 当前 back task
description: 
categories: [android, cm]
tags: [android, dumpsys]
---

省略包名就打印出系统所有task，一般不怎么做。

  adb shell dumpsys activity 包名

打印出Activity Manager的内容，其中Hist就是back task。

  adb shell dumpsys activity activities


## dumpsys 可dump出哪些系统信息
 
Get the list of services available

  $ adb shell service list