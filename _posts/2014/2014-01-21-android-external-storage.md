---
layout: post
title: Android Externel Storage 理论说明
description: 
categories: [android, dev]
tags: [android]
---

参考：
<http://source.android.com/devices/tech/storage/config.html>

4.2.2及以前，/etc/vold.fstab 中存放存储设备和挂载点之间的映射关系。

4.3开始配置文件放在根目录中以fstab开头的文件/fstab.<device>，例如，华为C8816：

```
$ adb shell ls / | grep fstab
external_sd.fstab
fstab.qcom
internal_sd.fstab
```

/etc/vold.fstab 文件格式基本类似。

dev_mount <label> <mount_point> <part> <sysfs_path1...>

> MOT XT882

> >dev_mount <label> <mount_point[:[asec_point]:[lun_point]]> <part> <sysfs_path1...>



/mnt/secure/asec，SD卡除了正常数据分区（如/mnt/sdcard），还有secure分区，可能和SD上安装app功能有关。




