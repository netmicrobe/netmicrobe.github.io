---
layout: post
title: telephonyManager 用户数据分析
description: 
categories: [android, dev]
tags: [android, telephony]
---

## MOT-XT882

ls  /data/data/com.android.providers.telephony/databases

```
operator.db    #
mmssms2.db   # 短信数据库
mmssms.db   # 短信数据库
telephony.db   #
dlut.db   #
```


ls /data/data/com.android.providers.telephony/shared_prefs/

```
preferred-apn.xml
```
