---
layout: post
title: android AsyncTask
description: 
categories: [android, dev]
tags: [android]
---

参考：<http://answers.oreilly.com/topic/2699-how-to-handle-threads-in-android-and-what-you-need-to-watch-for/>

AsyncTask is an Android mechanism created to help handle long operations that need to report to the UI thread. To take advantage of this class, we need to create a new subclass of AsyncTask and implement the doInBackground(), onProgressUpdate(), and onPostExecute() methods. In other words, we are going to fill in the blanks for what to do in the background, what to do when there’s some progress, and what to do when the task completes.

doInBackground()执行在 **非UI线程** 。


## 用AsyncTask下载文件

参考DownloadTesting工程

### 创建一个AsyncTask的子类，实现下载工作

{% highlight java %}
protected Integer doInBackground(URI... urls) {
    try {
        HttpClient hc = new DefaultHttpClient();
        
        // GET actual size of file，用Head方法获取文件大小
        HttpUriRequest hh = new HttpHead(urls[0]);
        HttpResponse hr = hc.execute(hh);
        String clstr = hr.getFirstHeader("Content-Length").getValue();
        if( clstr == null )
            throw new Exception("no such header: Content-Length");
        fileSize = Integer.parseInt(clstr);
        dlgDp.setMax(fileSize/1000);
        
        // Download... 使用Get或者Post方法下载文件
        HttpGet hg = new HttpGet(urls[0]);
        startTime = System.currentTimeMillis();
        hr = hc.execute(hg);
        latency = System.currentTimeMillis() - startTime;
        InputStream is = hr.getEntity().getContent();
        
        // CHECK IF ERROS, ie. 404, 500
        int responseCode = hr.getStatusLine().getStatusCode();
        if( responseCode > 400 ) {
            resultStr = responseCode + " Error";
            endTime = System.currentTimeMillis();
            return 0;
        }
        
        downSize = 0;
        try {
            bufsize = Integer.parseInt(textBufsize.getText().toString());
        } catch (Exception e) {
            bufsize = 1;
        }
        byte[] buf = new byte[bufsize*1024]; // 读取块的大小能影响下载速度
        int readsz = 0;
        while( (readsz = is.read(buf)) != -1 ) {
            Log.d(TAG, "read size = " + readsz);
            downSize += readsz;
            publishProgress(downSize/1000);
            
            if( isCancelled() ) {
                Log.d(TAG, "I know u Cancelled!");
                hg.abort(); // 一定要调用abort！！否则http IO仍然在下载，而且这个request结束之后才会调用onCancelled
                is.close();
                break;
            }
        }
        
        endTime = System.currentTimeMillis();
        elapse = (int)(endTime - startTime);
        speed = downSize / elapse;
        resultStr = "FINISHED";
        return downSize;
    } catch(Exception e) {
        e.printStackTrace();
        resultStr = "EXCEPTION:" + e.getMessage();
    }
    return null;
}
{% endhighlight %}

### 启动task
dtask = new DownAFileTask();
dtask.execute(URI.create(uristr));

### 终止task
dtask.cancel(true);
















