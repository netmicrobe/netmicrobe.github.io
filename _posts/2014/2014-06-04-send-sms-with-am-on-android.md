---
layout: post
title: 使用am调用短信发送程序
description: 
categories: [android, cm]
tags: [android, am]
---

{% highlight shell %}
adb shell am start -a android.intent.action.VIEW -t "vnd.android-dir/mms-sms" -e sms_body "短信内容，在Windows上用中文是乱码，Linux是好的，擦！" -e address 18921446853
 
adb shell "am start -a android.intent.action.VIEW -t 'vnd.android-dir/mms-sms' -e sms_body '<D9:YKnon8mj4h<:|>=?|>=?|>=?|>=?o=8>o=8>o=8>' -e address 18921446853"

{% endhighlight %}