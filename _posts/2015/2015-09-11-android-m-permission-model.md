---
layout: post
title: Android M permission model – Android 6 权限控制
date: 2015-09-11
categories: [android, security]
tags: [android, security]
---

参考： <http://developer.android.com/preview/features/runtime-permissions.html>
 
 
Android M 上的app，不是要求用户在安装时候接受所有 permission'S ，而是需要某个 permission 的时就向系统申请，系统提示对话框，共用户选择是否允许。

当前前提是，这个app在Manifest里边声明，target=23，就是针对 Android M 开发的。

<!-- more -->

Android M 的权限模型（Android M's new permission model）
--------------------------------------------------------------

* Declaring Permissions :

    还要和原来一样，需要的 permission 在 AndroidManifest.xml 中声明。
    
* Permission Groups :

    permission'S 在 Android M 上被分组。例如， CONTACTS 权限组，包含所有读写用户通讯录的权限。
    
    app第一次使用“权限组”中的权限，用户同意后，所有该“权限组”的权限，以后app都可以直接使用，系统不会再询问用户了。
    
* Limited Permissions Granted at Install Time :

    安装的时候，有部分 permission'S 是直接被允许的，无需用户判断。这些 permission‘S 被称为 PROTECTION_NORMAL。
    
* User Grants Permissions at Run-Time :

    app 在程序运行时，请求 permission ， 系统给用户提示对话框，并将用户选择的结果，通过 callback function onRequestPermissionsResult()  返回 app。

### 老app在Android M 新的 permission 规则下运行

可以正常运行，但是如果用户在设置里边，针对app手动关闭权限，可能会导致 app 出错，例如， app请求日历的权限被关闭，可能就只能获取到一个空的数据。


Android M 上的开发建议
------------------------------------------

* Always Check for Permissions:

  app 要使用到鉴权的api的时候，提前检查用户是否赋权。
  
* Handle Lack of Permissions Gracefully :

  用户没有赋权时，app要正确处理，友好提醒用户。测试的时候要注意哦！！
  
* Permissions are Revocable :

  用户可以在设置里边，收回已经给予app的permission。又多了一个测试点！！
  
  可以不用申请 permission，而是调用提供该功能的其他app，例如，不去申请摄像头的操控权限，而是利用ACTION_IMAGE_CAPTURE intent 去调用已有的拍照app。

编码指南
------------------------------------------

* Enabling the new permissions model

  Manifest 里边  targetSdkVersion="MNC"     compileSdkVersion="android-MNC"

* 新的权限声明方式， Designating a permission for the M Preview only

  <uses-permission-sdk-m> 可以在 Manifest 中使用这个tag来声明permission使用，这样在Android M上安装app或升级的时候，就不会提醒用户了。

* 如何辨别系统是Android M

  Build.VERSION.CODENAME. If the device is running the M Developer Preview, CODENAME is "MNC" 

* app如何检查 permission 是否被允许

  Context.checkSelfPermission(Manifest.permission.CAMERA)

* 检查用户上次的赋权操作（上次允许了？）

  ** Activity.shouldShowRequestPermissionRationale()

  返回 true ， This method returns true if the app has requested this permission previously and the user denied the request.

  返回 false， if the user turned down the permission request in the past and chose the Don't ask again option in the permission request system dialog, this method returns false

* app 向用户请求 permission ，requestPermissions()

  {% highlight java %}
  if( checkSelfPermission(Manifest.permission.READ_CONTACTS) != PackageManager.PERMISSION_GRANTED ) {
    // Should we show an explanation?
    if( shouldShowRequestPermissionRationale( Manifest.permission.READ_CONTACTS ) ){
      // Explain to the user why we need to read the contacts
    }
    requestPermissions( 
      newString[] { anifest.permission.READ_CONTACTS },
      MY_PERMISSIONS_REQUEST_READ_CONTACTS
    );    // MY_PERMISSIONS_REQUEST_READ_CONTACTS is an app-defined int constant
    return;
  }
  {% endhighlight %}

* 系统返回用户的赋权结果

{% highlight java %}
@Override
public void onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {
  switch( requestCode ){
    case MY_PERMISSIONS_REQUEST_READ_CONTACTS:
    {
      if(grantResults[0]==PackageManager.PERMISSION_GRANTED){
        // permission was granted, yay! do the                
        // calendar task you need to do.
      } else {
        // permission denied, boo! Disable the
        // functionality that depends on this permission.
      }
      return;
    }
    // other 'switch' lines to check for other
    // permissions this app might request
  }
}
{% endhighlight %}


测试指南
------------------------------------------

使用adb安装时，即同意所有权限

```
adb install -g <path_to_apk>
```

给指定app赋予权限

```
adb pm grant <package_name> <permission_name>
```

例如：

```
adb pm grant com.example.myapp android.permission.RECORD_AUDIO
```

撤回之前赋予的权限

```
adb pm revoke <package_name> <permission_name>
```

参考
-------------------------------------

### PROTECTION_NORMAL:

    android.permission.ACCESS_LOCATION_EXTRA_COMMANDS
    android.permission.ACCESS_NETWORK_STATE
    android.permission.ACCESS_NOTIFICATION_POLICY
    android.permission.ACCESS_WIFI_STATE
    android.permission.ACCESS_WIMAX_STATE
    android.permission.BLUETOOTH
    android.permission.BLUETOOTH_ADMIN
    android.permission.BROADCAST_STICKY
    android.permission.CHANGE_NETWORK_STATE
    android.permission.CHANGE_WIFI_MULTICAST_STATE
    android.permission.CHANGE_WIFI_STATE
    android.permission.CHANGE_WIMAX_STATE
    android.permission.DISABLE_KEYGUARD
    android.permission.EXPAND_STATUS_BAR
    android.permission.FLASHLIGHT
    android.permission.GET_PACKAGE_SIZE
    android.permission.INTERNET
    android.permission.KILL_BACKGROUND_PROCESSES
    android.permission.MODIFY_AUDIO_SETTINGS
    android.permission.NFC
    android.permission.READ_SYNC_SETTINGS
    android.permission.READ_SYNC_STATS
    android.permission.RECEIVE_BOOT_COMPLETED
    android.permission.REORDER_TASKS
    android.permission.REQUEST_INSTALL_PACKAGES
    android.permission.SET_TIME_ZONE
    android.permission.SET_WALLPAPER
    android.permission.SET_WALLPAPER_HINTS
    android.permission.SUBSCRIBED_FEEDS_READ
    android.permission.TRANSMIT_IR
    android.permission.USE_FINGERPRINT
    android.permission.VIBRATE
    android.permission.WAKE_LOCK
    android.permission.WRITE_SYNC_SETTINGS
    com.android.alarm.permission.SET_ALARM
    com.android.launcher.permission.INSTALL_SHORTCUT
    com.android.launcher.permission.UNINSTALL_SHORTCUT

### Permissions and permission groups.

<table>
<tr>
  <th>Permission Group</th>
  <th>Permissions</th>
</tr>
<tr>
  <td>android.permission-group.CALENDA</td>
  <td>
    <ul>
      <li>android.permission.READ_CALENDAR</li>
      <li>android.permission.WRITE_CALENDAR</li>
    </ul>
  </td>
</tr>
<tr>
  <td>android.permission-group.CAMERA</td>
  <td>
    <ul>
      <li>android.permission.CAMERA</li>
    </ul>
  </td>
</tr>
<tr>
  <td>android.permission-group.CONTACTS</td>
  <td>
    <ul>
      <li>android.permission.READ_CONTACTS</li>
      <li>android.permission.WRITE_CONTACTS</li>
      <li>android.permission.GET_ACCOUNTS</li>
    </ul>
  </td>
</tr>
<tr>
  <td>android.permission-group.LOCATION</td>
  <td>
    <ul>
      <li>android.permission.ACCESS_FINE_LOCATION</li>
      <li>android.permission.ACCESS_COARSE_LOCATION</li>
    </ul>
  </td>
</tr>
<tr>
  <td>android.permission-group.MICROPHONE</td>
  <td>
    <ul>
      <li>android.permission.RECORD_AUDIO</li>
    </ul>
  </td>
</tr>
<tr>
  <td>android.permission-group.PHONE</td>
  <td>
    <ul>
      <li>android.permission.READ_PHONE_STATE</li>
      <li>android.permission.CALL_PHONE</li>
      <li>android.permission.READ_CALL_LOG</li>
      <li>android.permission.WRITE_CALL_LOG</li>
      <li>com.android.voicemail.permission.ADD_VOICEMAIL</li>
      <li>android.permission.USE_SIP</li>
      <li>android.permission.PROCESS_OUTGOING_CALLS</li>
    </ul>
  </td>
</tr>
<tr>
  <td>android.permission-group.SENSORS</td>
  <td>
    <ul>
      <li>android.permission.BODY_SENSORS</li>
    </ul>
  </td>
</tr>
<tr>
  <td>android.permission-group.SMS</td>
  <td>
    <ul>
      <li>android.permission.SEND_SMS</li>
      <li>android.permission.RECEIVE_SMS</li>
      <li>android.permission.READ_SMS</li>
      <li>android.permission.RECEIVE_WAP_PUSH</li>
      <li>android.permission.RECEIVE_MMS</li>
      <li>android.permission.READ_CELL_BROADCASTS</li>
    </ul>
  </td>
</tr>
<tr>
  <td>android.permission-group.STORAGE</td>
  <td>
    <ul>
      <li>android.permission.READ_EXTERNAL_STORAGE</li>
      <li>android.permission.WRITE_EXTERNAL_STORAGE</li>
    </ul>
  </td>
</tr>

</table>





