---
layout: post
title: 管理AVDs
description: 
categories: [android, cm]
tags: [android, avd]
---


参考：
<http://developer.android.com/tools/devices/managing-avds-cmdline.html#listingtargets>

### List Targets

```
android list targets
```

### 列出所有avd

```
android list avd
```

### Create avd

```
android create avd --help
```

如果avd的target是add-on，则不能自定义hardware profile，因为add-on已经由发布厂家配置好了。
自定义hardware profile的时候，可以设置density、resolution等等。

例子：

```
android create avd --name my_android1.5--target 2
android create avd -n <name>-t <targetID>--skin WVGA800
```

### 运行Emulator时，调整dpi

```
emulator -avd WVGA800 -scale 96dpi-dpi-device 160
```

### avd设置的保存位置

~/.android/avd

#### 手动修改avd的属性 文件 .android/avd/your-avd-name/config.ini

##### 设置默认sdcard image文件：

```
hw.sdcard=yes
sdcard.path=/home/ethan/sdk/android/sd64m.img
```

##### 设置方向键可用

```
hw.dPad=yes
```


### 更新avd

android update avd --help

### 移动avd

android move avd --help

### 删除avd

android delete avd -n <name>






