---
layout: post
title: Android手机修改Hosts的方法
description: 
categories: [android, cm]
tags: [android]
---



先通过各种方法让Android手机获取Root权限，之后运行Root Explorer管理器，进入可写状态，找到/system/etc/hosts的文件，将其权限修改为可写 


* 问题：中途可能遇到 /system Read-only file system 

解决：

```
adb shell 
mount -o remount rw /system 
```

* 参考： 

<http://www.111cn.net/sj/android/44496.htm>
<http://blog.csdn.net/candyguy242/article/details/8084023>

