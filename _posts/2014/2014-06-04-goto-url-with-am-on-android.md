---
layout: post
title: 使用am调用浏览器Goto指定URL
description: 
categories: [android, cm]
tags: [android, am]
---

{% highlight shell %}
adb shell am start -a android.intent.action.VIEW -d <the-url>
{% endhighlight %}

例如：
{% highlight shell %}
adb shell am start -a android.intent.action.VIEW -d http://www.baidu.com/
{% endhighlight %}
 
* 注意点：
  * URL过于复杂的时候最好用引号括起来
  * URL中存在&符合，在windows上执行要在前面加转义字符“\”
 
例如：

{% highlight shell %}
adb shell am start -a android.intent.action.VIEW -d "http://192.168.251.65:6155/api/v2/mobile/game_detail.json?terminal_id=363\&game_id=243954"
{% endhighlight %}


