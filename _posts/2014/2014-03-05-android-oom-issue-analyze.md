---
layout: post
title: Android OOM 问题
description: 
categories: [android, dev]
tags: [android, oom]
---

Android app可用heap限制在24M。

有如下2种方法突破限制：

1. 使用NDK和JNI技术，在native code中分配内存，这个不受24M大小显示。
2. 使用OpenGL的textures，贴图不受24M限制。