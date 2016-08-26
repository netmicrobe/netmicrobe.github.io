---
layout: post
title: apktool 编译
description: 
categories: [android, cm]
tags: [android, apktool]
---

参考：<http://blog.csdn.net/tz2101/article/details/19193197>

## 下载源码

apktool这个项目是googlecode上的，没法访问，到github找了个镜像：
git clone https://github.com/iBotPeaches/Apktool.git

## 设置环境
设置aapt到系统路径

brut.apktool\apktool-lib\src\main\resources\prebuilt\aapt\windows\aapt 放到系统PATH

## 编译

在项目更目录，执行编译，会自动下载gradle后，编译。
gradlew.bat build fatJar

编译完成后，brut.apktool\apktool-cli\build\libs 下的 apktool-cli.jar 就可以使用了。

## 使用

通过bat脚本使用：apktool.bat

{% highlight shell %}
@echo off
set PATH=%CD%;%PATH%;
java -jar -Duser.language=en "%~dp0\apktool_2.0.0-259052-SNAPSHOT.jar" %1 %2 %3 %4 %5 %6 %7 %8 %9
{% endhighlight %}
