---
layout: post
title: 使用命令行开发管理Android - 2 , Android 4.x
description: 
categories: [android, cm]
tags: [android]
---

原来的build.properties 变为 ant.properties

示例：ant.properties

{% highlight yaml %}
# 签名
key.store=<证书store文件地址，与build.xml一个目录，直接写文件名>
key.alias=<证书store文件中的证书名称>
key.store.password=<密码>
key.alias.password=<密码>
# 混淆
proguard.config=proguard.cfg # 与build.xml一个目录下的proguard.cfg
# 新的ADT版本生成的是

{% endhighlight %}

