---
layout: post
title: android installed app size
description: 
categories: [android, dev]
tags: [android]
---


## 参考：

* <http://www.kpbird.com/2012/10/in-depth-android-package-manager-and.html>
* <http://android.stackexchange.com/a/28231>
* <http://stackoverflow.com/questions/14100985/make-our-android-application-work-as-a-preinstalled-application>

## 已安装 app 大小计算

apk安装后占用的大小，可以在设置》应用程序》某个app的详情中看到。

大小信息包括：

	Total（总大小） = App（应用程序） + Data（数据） + PhoneStorage（手机存储） + USB存储（应用程序如果安装在SD卡上）

App（应用程序）：缓存的dex和apk文件的大小之和。

缓存dex在：/data/dalvik-cache，例如：

```
$ adb shell ls -l /data/dalvik-cache | grep taobao
-rw-r--r-- system   u0_a404   8041040 2014-01-09 21:34 data@app@com.taobao.taobao-1.apk@classes.dex
```


缓存apk可能在2个地方：

1 如果是预置的，会在/system/app
2 如果直接安装的，会在/data/app

例如：

```
$ adb shell ls -l /data/app | grep taobao
-rw-r--r-- system   system   22267376 2014-01-09 21:34 com.taobao.taobao-1.apk
```



