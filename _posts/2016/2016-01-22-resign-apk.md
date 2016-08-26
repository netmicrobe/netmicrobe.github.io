---
layout: post
title: android ： 对 apk 去签名、手动签名（resign）
date: 2016-01-22
categories: [android]
tags: [android, java, security]
---

参考： <http://developer.android.com/intl/ru/tools/publishing/app-signing.html#signing-manually>

删除签名
-------------
用 压缩工具（如，7z）删除 apk 中 META-INF 目录下所有文件

添加签名
-------------
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore D:\where-you-store-keys\wikey weixin6322android821.apk wi
执行命令后，会提示输入密码，输入后，等待命令执行完毕即可。

其他参考：
-------------
* Trail: Security Features in Java SE

  <http://docs.oracle.com/javase/tutorial/security/index.html>

* Summary of Tools for Java Platform Security

  <https://docs.oracle.com/javase/8/docs/technotes/guides/security/SecurityToolsSummary.html>

* Oracle The Java™ Tutorials  > Signing JAR Files

  <https://docs.oracle.com/javase/tutorial/deployment/jar/signing.html>

* Signing jar files with jarsigner

  <https://www.owasp.org/index.php/Signing_jar_files_with_jarsigner>

* Oracle jarsigner tutorial

  <http://docs.oracle.com/javase/7/docs/technotes/tools/windows/jarsigner.html>
  
  <http://download.java.net/jdk7/archive/b125/docs/technotes/tools/solaris/jarsigner.html>

* Android signing manual

  <http://android.google.com/tools/publishing/app-signing.html#signing-manually>

* zip-signer

  <https://code.google.com/p/zip-signer/>

* apk-resigner

  <https://code.google.com/p/apk-resigner/>

* Android APK 签名比对

  <http://www.blogjava.net/zh-weir/archive/2011/07/19/354663.html>

* APK Crack

  <http://www.blogjava.net/zh-weir/archive/2011/06/11/352099.html>

* Android: remove existing signature from APK

  <http://www.xinotes.net/notes/note/1194/>






