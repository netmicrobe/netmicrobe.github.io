---
layout: post
title: android 本地文档，search 不可用
description: 
categories: [android, cm]
tags: [android]
---


android 本地文档，search 不可用

## 原因：

可能js中获取文档root路径有问题吧，没深究，用firefox调试了下，看解决就行

## 解决方法：

修改文件 D:\sdk\android\android-sdk-windows\docs\assets\js\search_autocomplete.js

{% highlight javascript %}
function sync_selection_table(toroot)
{
    ...

    $li.mousedown(function() {
        // REMOVE BY WI
        // window.location = this.firstChild.getAttribute("href");
        // ADD BY WI, for search work on local documents!
        window.location = 'file:///D:/sdk/android/android-sdk-windows/docs/' + this.firstChild.getAttribute("href");
        
    });
    ...
}
{% endhighlight %}