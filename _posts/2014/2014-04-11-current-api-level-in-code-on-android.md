---
layout: post
title: 获取当前系统的API LEVEL
description: 
categories: [android, dev]
tags: [android]
---

{% highlight java %}
public int obtainApiLevel() {
    int ret = 0;
    if( 0 == ret ) {
        try {
            // SDK_INT only exists since API 4 so let's use the string version
            ret = Integer.parseInt(android.os.Build.VERSION.SDK);
        } catch (Exception e) {
            ret = 3;
        }
    }
    
    // another method
    //        android.provider.Settings.System.getInt(this.getContentResolver(),
    //                android.provider.Settings.System.SYS_PROP_SETTING_VERSION);
    
    // another method
    //        getPackageManager().getPackageInfo(getPackageName(),0).applicationInfo.targetSdkVersion;
    
    Log.d(TAG, "obtainApiLevel()=" + ret);
    return ret;
}
{% endhighlight %}