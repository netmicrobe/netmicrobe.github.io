---
layout: post
title: android，安装ADT，更新SDK
description: 
categories: [android, cm]
tags: [android]
---

google的https连接不稳定，导致android的SDK，ADT都安装有问题。

## 方法一，不使用https而是用http：

在SDK Manager下Tools->Options打开了SDK Manager的Settings，选中“Force https://… sources to be fetched using http://…”，强制使用http协议。

而在更新ADT插件的时候则使用网址http://dl-ssl.google.com/android/eclipse，而不是https://dl-ssl.google.com/android/eclipse

## 方法二，使用ip地址

强制指向下Hosts ----澳大利亚Google公司澳大利亚悉尼数据中心的IP地址，以下是添加内容：

74.125.237.1 dl-ssl.google.com


## 参考：

* <http://blog.sina.com.cn/s/blog_4a94a0db0100y4h7.html>
* <http://blog.csdn.net/kieven2008/article/details/7434583>