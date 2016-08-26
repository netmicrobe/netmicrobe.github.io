---
layout: post
title: 使用命令行开发管理Android
description: 
categories: [android, cm]
tags: [android]
---


## 创建项目

Creating a new project with build.xml

If you've already created your project and followed the above instructions, you can skip this section. If not, you can may either create a new Android project using the regular Eclipse method (via New > Other... > Android Project), and follow the instructions in the above section, or you can use the command line as described here.

android create project --name YourProjectName --path C:\dev\YourProject --target android-3 --package com.company.testproject --activity MainActivity

生成目录：src/ res/ bin/ libs/

生成文件：

```
AndroidManifest.xml
build.properties由开发人员在其中配置build时的参数，Android-tools不会修改它。
default.properites由android-tools创建和更新，必须checkin到Version Control System。
local.properties包含本地的SDK路径，不应该checkin Version Control System。
build.xml
proguard.cfg
```

Note: To see the available targets, use android list target and you should see something like:

```
> android list target
id: 1 or "android-3"
     Name: Android 1.5
     Type: Platform
     API level: 3
     Revision: 4
     Skins: HVGA (default), HVGA-L, HVGA-P, QVGA-L, QVGA-P
```
In the above case, you can use either 1 or android-3 as the target ID.

创建完成后，根目录下会生成build.xml，默认task为help，执行ant会显示可以使用的target。其中ant release将会编译后生成一个未签名的apk。

build.xml 利用的android项目的自定义task setup（com.android.ant.SetupTask）来完成一系列的编译、打包、执行的操作。所以初始的build.xml所有工作都是<setup />完成的。而setup实际上是import一系列实际干事的target来完成工作的。可以在<setup />前后添加target来完成自定的工作。

在Eclipse项目中使用build.xml
默认生成的build.xml在Eclipse中被认为有错误，因为build.xml中没有定义任何target，default target help 是被<setup /> import进来的。所以删除project default target定义就好了。
在bat脚本启动ant，可能需要在命令行中指明build.xml的绝对位置，可能项目中bat脚本的运行目录、eclipse运行目录、ant运行目录不一致。

## 自动签名

默认build.xml不知道签名的配置信息，所以ant release只能生成unsigned的apk包。在同目录下的build.properties添加一下配置信息，并将签名文件拷贝到同目录下就行了。

配置信息：

```
key.store=《keystored的文件名》
key.alias=《key alias》
如果添加下面的密码信息，就需要在执行ant的时候输入密码了：
key.store.password=《password》
key.alias.password=《password》
```

配置完成后，再执行ant release就会自动生成signed的apk包了。

## 自动安装签名后的apk

在build.xml的<setup />后面添加target install-r，执行ant install-r就可以直接安装release package到默认设备或浏览器上。

{% highlight xml %}
<target name="install-r" depends="release">
<exec executable="${adb}" failonerror="true">
<arg line="${adb.device.arg}" />
<arg value="install" />
<arg value="-r" />
<arg path="${out.release.file}" />
</exec>
</target>
{% endhighlight %}

* NOTE 安装到目标设备

tools/ant/main_rules.xml中

```
<property name="adb.device.arg" value="" />
```

所以安装到默认的设备或浏览器上。来指定安装目标，可以在ant命令执行时定义，如：

```
ant –Dadb.device.arg=[-d|-e|-s <serialNumber>]
```

或者在build.xml的 \<setup /\> 之前设置property adb.device.arg。

## 自动安装后，自动启动

可以利用ant，实现“自动启动”的target，发在“自动安装”的target之后运行，实现和eclipse中安装运行debug apk一样的效果。

### 从Manifest文件中获取包名和Activity名称

{% highlight xml %}
<!-- Name of the application package extracted from manifest file -->
<xpath input="AndroidManifest.xml" expression="/manifest/@package"
output="manifest.package" />
<xpath input="AndroidManifest.xml" expression ="/manifest/application/activity/@android:name"
output="manifest.activity" />
{% endhighlight %}


### 获取启动Activity的名称

从Manifest文件中获取的启动Activity名称形式多样，例如，

android:name=”.MainActivity”

或者，没有点，android:name=”.MainActivity”

或者，包名都也好的，android:name=”com.test.MainActivity”

需要在ant中使用字符处理task来处理从Manifest文件中获取的名称，

第三方的扩展ant-contrib提供这样的task，在sourceforge上可以下载到。

{% highlight xml %}
<taskdef name="propertyregex"
classname="net.sf.antcontrib.property.RegexTask">
<classpath>
<pathelement location="D:\\wihome\\projects\\android\\HelloCmd\\ant-contrib-1.0b3.jar" />
</classpath>
</taskdef>
<propertyregex property="manifest.activity.name"
input="${manifest.activity}"
regexp="[.]*[\.]*([^\.]*)$"
select="\1" />

{% endhighlight %}

### 利用命令adb shell am start -n <package-name>/<package-name>.<activity-name>启动已经安装的application。

{% highlight xml %}
<target name="run-r" depends="install-r">
<exec executable="${adb}" failonerror="true">
<arg line="${adb.device.arg}" />
<arg line="shell am start -n" />
<arg value="${manifest.package}/${manifest.package}.${manifest.activity.name}" />
</exec>
</target>
{% endhighlight %}


## 利用Config文件控制文件中常量内容

参看《Using Ant to Automate Building Android Applications》>> Using a Java configuration file

## 在Eclipse项目中使用ant

### 在Eclipse项目的根目录（AndroidManifest.xml同目录）执行

```
android update project –path .
```

执行完之后会在目录下生成build.xml

### 修改build.xml

默认的build.xml只包含target，target都被<setup />隐藏起来。eclipse ant plugin 认不出来隐藏的target就没法执行。所以需要做如下修改：

1. \<setup /\> 改为 \<setup import="false"/\>

2.  将rules文件（如，sdk.dir/tools/ant/main_rules.xml，一般都是main rules）手动import进来。
    将rules文件的project标签的内容，也即那些隐藏的target，拷贝到setup标签之后。

3. 在Eclipse中右键点击build.xml，选择run as >> ant build…，配置需要执行的target，就可以run了。
4. 将签名keystore文件拷贝到project根目录，配置build.properties文件，就可以自动生成签名好的apk了，如何配置，参见本文其他部分。

* Note
  build.xml的执行需要Eclipse ant plugin的ant版本在1.8以上。最新的eclipse 3.7（indigo）中的ant已经达到1.8。

## Ant启动




## 参考

1. SDK DOC >> Developing >> Managing Projects >> From the Command Line
2. SDK DOC >> Developing >> Building and Running
3. Online DOC >> Using Ant to Automate Building Android Applications






