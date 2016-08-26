---
layout: post
title: 使用apktool 分析 framework 文件
description: 
categories: [android, cm]
tags: [android, apktool]
author: apktool-wiki
---

摘自： <https://code.google.com/p/android-apktool/wiki/FrameworkFiles>

## Overview

As you probably know, Android apps use some code and resources that are built into the Android system on your device. Apktool needs these framework files to decode and build apks.

Standard framework is embedded into apktool, so you don't need to do anything for most apk files. But some manufacturers, for example HTC, add their own framework files and use them in system apps. To use apktool against such apps, you must pull framework from a device and install/register it to apktool.

## Example

You want to decode HtcContacts.apk from Hero device. If you try to do that, you will get an error message:

{% highlight shell%}
$ apktool d HtcContacts.apk
I: Loading resource table...
I: Decoding resources...
I: Loading resource table from file: /home/brutall/apktool/framework/1.apk
W: Could not decode attr value, using undecoded value instead: ns=android, name=drawable, value=0x02020542
...
W: Could not decode attr value, using undecoded value instead: ns=android, name=icon, value=0x02020520
Can't find framework resources for package of id: 2. You must install proper framework files, see project website for more info.
{% endhighlight %}


You must pull HTC resources from your device and install them:

{% highlight shell%}
$ apktool if com.htc.resources.apk
I: Framework installed to: /home/brutall/apktool/framework/2.apk
{% endhighlight %}

Then:

{% highlight shell%}
$ apktool d HtcContacts.apk
I: Loading resource table...
I: Decoding resources...
I: Loading resource table from file: /home/brutall/apktool/framework/1.apk
I: Loading resource table from file: /home/brutall/apktool/framework/2.apk
I: Copying assets and libs...
{% endhighlight %}

Yay, that works :-)



## Pulling frameworks

They are usually in /system/framework/ dir, but system maker could move them to other place: e.g. on some custom roms they are in /data/system-framework/ dir (problems with too small system partition, I guess). 

They are named with some "resources", "res", "framework", etc., for example HTC uses com.htc.resources.apk name. framework-res.apk is usually main Android framework and you probably don't need to install it, because apktool embeds it.

When you find framework file, you could pull it using "adb pull" command or use some file manager app. Also you could look, how apktool has named installed file: usually it should be "2.apk", if it's something different, then this may not be a file, which you are looking for.





## Tagging and managing framework files

Frameworks are stored in: $HOME/apktool/framework/<id>-<tag>.apk . They are identified by package id and optionally custom tag. Usually tagging frameworks isn't necessary, but if you work on apps from many different devices and they have incompatible frameworks, you will need some way to easily switch between them.

You could tag frameworks by:

{% highlight shell%}
$ apktool if com.htc.resources.apk hero
I: Framework installed to: /home/brutall/apktool/framework/2-hero.apk
$ apktool if com.htc.resources.apk desire
I: Framework installed to: /home/brutall/apktool/framework/2-desire.apk
{% endhighlight %}

Then:

{% highlight shell%}
$ apktool d -f -t hero HtcContacts.apk
I: Loading resource table...
I: Decoding resources...
I: Loading resource table from file: /home/brutall/apktool/framework/1.apk
I: Loading resource table from file: /home/brutall/apktool/framework/2-hero.apk
I: Copying assets and libs...

$ apktool d -f -t desire HtcContacts.apk
I: Loading resource table...
I: Decoding resources...
I: Loading resource table from file: /home/brutall/apktool/framework/1.apk
I: Loading resource table from file: /home/brutall/apktool/framework/2-desire.apk
I: Copying assets and libs...
{% endhighlight %}

You don't have to select a tag when building apk - apktool automatically uses same tag, as when decoding.

I think both standard Android and HTC resources are backward compatible so far, so if you often switch between e.g. Magic and Hero, then framework from Hero should work for Magic too - you don't have to tag them, just install one from newer device. But this isn't a rule - all depends on manufacturer decisions. If apktool decode and build an app without any errors, then most probably everything is ok.

Apktool doesn't have an option to remove or rename already installed framework files, but you could manage these files directly - it's easy thing.


