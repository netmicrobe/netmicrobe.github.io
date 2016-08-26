---
layout: post
title: 修改avd等存放目录
description: 
categories: [android, cm]
tags: [android]
---

默认.android 文件夹会被创建在C:盘的home目录中，越来越大，消耗C：盘空间。

新添加一个环境变量，名字为 "ANDROID_SDK_HOME”，变量值为".android"文件夹(AVD信息)所在路径(路径中不包含.android)