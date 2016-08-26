---
layout: post
title: windows上avd目录的设置
description: 
categories: [android, cm]
tags: [android, avd]
---

路径设置Eclipse中创建Android Emulator时，相应的文件会被放置到 **“C:\Documents and Settings\Administrator\.android“** 下面。

如果想改变AVD的路径设置，方法：

新添加一个环境变量，名字为 "ANDROID_SDK_HOME”，变量值为".android"文件夹(AVD信息)所在路径(路径中不包含.android)

参考：
<http://blog.csdn.net/generalyy0/article/details/8195977>