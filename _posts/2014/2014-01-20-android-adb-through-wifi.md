---
layout: post
title: 通过WIFI连接ADB
description: 
categories: [android, cm]
tags: [android, adb]
---

通过WIFI连接ADB
 
## 在root过的设备上打开WIFI adb

{% highlight shell %}
setprop service.adb.tcp.port 5555
stop adbd
start adbd
{% endhighlight %}

And you can disable it and return ADB to listening on USB with

{% highlight shell %}
setprop service.adb.tcp.port -1
stop adbd
start adbd
{% endhighlight %}
 
## 使用同一子网的PC连接设备
 
 {% highlight shell %}
adb tcpip 5555
adb connect <device-ip>:5555
{% endhighlight %}
 
## 使用DDMS
利用adb connect连接上设备后，直接启动DDMS即可，此时DDMS已经显示连接上的设备。
 
## 切换回usb连接

adb usb
