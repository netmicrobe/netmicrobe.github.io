---
layout: post
title: Android 宇龙手机双sim信息读取方法，短信发送方法
description: 
categories: [android]
tags: [android, dual-sim]
---

com.yulong.android.telephony.CPTelephonyManager  //获取imsi卡号的类 

com.yulong.android.telephony.CPSmsManager    //发短信的类

## 获取第二张SIM卡信息

Coolpad 9190L_C00 4.4 提供的宇龙双卡双待方案，CPTelephonyManager宇龙新增类 ，获取双卡卡信息的接口如下：

{% highlight java %}
public String getDualSubscriberId(int phoneId)
{% endhighlight %}

参  数：phoneId取值（1 ：卡1，2：卡2）

返回双卡的IMSI ，获取第二张卡信息参考如下方式使用反射：

{% highlight java %}
   CPTelephonyManager tm = (CPTelephonyManager ) getApplicationContext().getSystemService(Context.TELEPHONY_SERVICE);
   String mCard2Imsi = tm. getDualSubscriberId(2);
{% endhighlight %}

## 选择第二张SIM卡发送短信

Coolpad 9190L_C00 4.4 提供的宇龙双卡双待方案，CPSmsManager宇龙新增类 ，发送双卡信息的接口如下：

{% highlight java %}
public void sendDualTextMessage(String destinationAddress, String scAddress, String text,int priority,
            PendingIntent sentIntent, PendingIntent deliveryIntent, int mPhoneId)
{% endhighlight %}

参  数：phoneId取值（1 ：卡1，2：卡2）

