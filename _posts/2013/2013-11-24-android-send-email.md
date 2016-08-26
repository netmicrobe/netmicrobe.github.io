---
layout: post
title: android Send a email
description: 
categories: [android, dev]
tags: [android]
---

## 发送纯文本邮件

{% highlight java %}
Intent intent = new Intent(Intent.ACTION_SEND);
intent.setType("text/plain");
intent.putExtra(Intent.EXTRA_TITLE, "mail title");
intent.putExtra(Intent.EXTRA_SUBJECT, "mail subject");
intent.putExtra(Intent.EXTRA_TEXT, getString(R.string.mail_content));
startActivity(intent);
{% endhighlight %}
                
## 添加附件

{% highlight java %}
intent.putExtra(Intent.EXTRA_STREAM, Uri.fromFile(new File("/path/to/file")));
{% endhighlight %}


## 添加多个附件
Intent intent = new Intent(Intent.ACTION_SEND_MULTIPLE);
intent.setType("text/plain");
intent.putExtra(Intent.EXTRA_SUBJECT, "Test multiple attachments");
intent.putExtra(Intent.EXTRA_TEXT, "Mail with multiple attachments");
intent.putExtra(Intent.EXTRA_EMAIL, new String[]{recipient_address});
ArrayList<Uri> uris = new ArrayList<Uri>();
uris.add(Uri.fromFile(new File("/path/to/first/file")));
uris.add(Uri.fromFile(new File("/path/to/second/file")));
intent.putParcelableArrayListExtra(Intent.EXTRA_STREAM, uris);

附件有多种格式，mime type 设置为：multipart/mixed


给用户弹出选择列表，使用哪个客户端去Send：

startActivity(Intent.createChooser(intent, "Send mail"));



















