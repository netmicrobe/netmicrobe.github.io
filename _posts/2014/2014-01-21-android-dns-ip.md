---
layout: post
title: 查看域名的IP
description: 
categories: [java, dev]
tags: [java]
---

{% highlight java %}
InetAddress address =InetAddress.getByName("www.example.com");
System.out.println(address.getHostAddress());
{% endhighlight %}

