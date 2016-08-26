---
layout: post
title: logcat 命令行，过滤tag
description: 
categories: [android, cm]
tags: [android, logcat]
---

{% highlight shell %}
adb logcat -s "DEBUG", "InputDispatcher"
{% endhighlight %}

多个tag用逗号隔开