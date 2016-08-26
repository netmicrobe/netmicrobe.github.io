---
layout: post
title: Android 5 Lollipop
description: 
categories: [android]
tags: [android]
---

参考：<http://developer.android.com/about/versions/lollipop.html>

Android 5 除了支持手机、平板，还支持可穿戴设备、TV、汽车等。

## 界面效果提升

加了3D的界面效果、按钮按下波纹效果。。。

## 性能提升

app运行在ART runtime，app的响应时间缩短，GC的时间缩短。

支持更多的处理器架构：ARM, x86, and MIPS architectures and is fully 64-bit compatible.

全面支持64位架构。对Java写app无任何影响。NDK写的程序，要注意下，已经支持 new ABIs for ARM v8, and x86-64, and MIPS-64.
对于视频播放，加强音画同步（A/V Sync）。

## 通知栏

能够在锁屏界面显示通知的更多信息。
提供标准播放器通知模板。

## 对TV的支持

> Android TV provides a complete TV platform for your app's big screen experience. Android TV is centered around a simplified home screen experience that allows users to discover content easily, with personalized recommendations and voice search.

> With Android TV you can now create big, bold experiences for your app or game content and support interactions with game controllers and other input devices. To help you build cinematic, 10-foot UIs for television, Android provides a leanback UI framework in the v17 support library.

> The Android TV Input Framework (TIF) allows TV apps to handle video streams from sources such as HDMI inputs, TV tuners, and IPTV receivers. It also enables live TV search and recommendations via metadata published by the TV Input and includes an HDMI-CEC Control Service to handle multiple devices with a single remote.

> The TV Input Framework provides access to a wide variety of live TV input sources and brings them together in a single user interface for users to browse, view, and enjoy content. Building a TV input service for your content can help make your content more accessible on TV devices.

## app中支持多个文档窗口

> Document-centric apps

> > Android 5.0 introduces a redesigned Overview space (formerly called Recents) that’s more versatile and useful for multitasking.

> > New APIs allow you to show separate activities in your app as individual documents alongside other recent screens.
You can take advantage of concurrent documents to provide users instant access to more of your content or services. For example, you might use concurrent documents to represent files in a productivity app, player matches in a game, or chats in a messaging app.

>> ![](/images/android/screenshot/android-5-lollipop/multitasking.png){:width="200px"}

## 网络连接功能升级

蓝牙、NFC、多网络（wifi、cellular等） 支持的更全面。

## 高性能图形处理

支持OpenGL ES 3.1，高质量贴图、渲染、AEP扩展包。。。

## 更加强大的音频支持

低延迟声音输入。。。多声道混合。。。支持usb的耳机、音箱。。。支持Opus音频编码。。。

## 摄像和视频控制更多

更多的摄像控制API。。。流媒体处理利用H.265 High Efficiency Video Coding (HEVC) 优化视频编解码。。。支持4K超高清。。。

## 商业环境中的Android

。。。保持公司环境中Android的app和数据安全。。。公司IT人员可以对手机进行设置。。。

## 截屏、分享

添加了截屏和分享功能。

## 新增的传感器

。。。新增倾斜传感器（tile Sensor）。。。心跳速率传感器（Heart Rate Sensor），有人触摸设备，就能测出心跳速率。。。

。。。更多手势支持。。。唤醒手势。。。

## Chromium WebView

从4.4开始Android使用Chromium，Android 5 使用新的Chromium版本，WebView基于 Chromium M37 release，支持WebRTC, WebAudio, and WebGL。

> Chromium WebView

> >The initial release for Android 5.0 includes a version of Chromium for WebView based on the Chromium M37 release, adding support for WebRTC, WebAudio, and WebGL.

> >Chromium M37 also includes native support for all of the Web Components specifications: Custom Elements, Shadow DOM, HTML Imports, and Templates. This means you can use Polymer and its material design elements in a WebView without needing polyfills.

> >Although WebView has been based on Chromium since Android 4.4, the Chromium layer is now updatable from Google Play.

> >As new versions of Chromium become available, users can update from Google Play to ensure they get the latest enhancements and bug fixes for WebView, providing the latest web APIs and bug fixes for apps using WebView on Android 5.0 and higher.

## 可用性和输入法

。。。能获取屏幕上可见窗口的更多信息，定制更多用户体验。。。输入法可以快速切换。。。

## 新的耗电量调试工具

> Tools for building battery-efficient apps

> > New job scheduling APIs allow you optimize battery life by deferring jobs for the system to run at a later time or under specified conditions, such as when the device is charging or connected to Wi-Fi.

> > A new dumpsys batterystats command generates battery usage statistics that you can use to understand system-wide power use and understand the impact of your app on the device battery. You can look at a history of power events, approximate power use per UID and system component, and more.

> > Battery Historian is a new tool to convert the statistics from dumpsys batterystats into a visualization for battery-related debugging. You can find it at https://github.com/google/battery-historian.

>> ![](/images/android/screenshot/android-5-lollipop/battery_historian.png)
