---
layout: post
title: Android - Multiple Users
description: 
categories: [android]
tags: [android]
---

Multiple Users
---------------------------

Android now allows multiple user spaces on shareable devices such as tablets. Each user on a device has his or her own set of accounts, apps, system settings, files, and any other user-associated data.

As an app developer, there’s nothing different you need to do in order for your app to work properly with multiple users on a single device. Regardless of how many users may exist on a device, the data your app saves for a given user is kept separate from the data your app saves for other users. The system keeps track of which user data belongs to the user process in which your app is running and provides your app access to only that user’s data and does not allow access to other users’ data.

Saving data in a multi-user environment
---------------------------

Whenever your app saves user preferences, creates a database, or writes a file to the user’s internal or external storage space, that data is accessible only while running as that user.

To be certain that your app behaves properly in a multi-user environment, do not refer to your internal app directory or external storage location using hard-coded paths and instead always use the appropriate APIs:

For access to internal storage, use getFilesDir(), getCacheDir(), or openFileOutput().
For access to external storage, use getExternalFilesDir() or getExternalStoragePublicDirectory().
No matter which of these APIs you use to save data for a given user, the data will not be accessible while running as a different user. From your app’s point of view, each user is running on a completely separate device.

Identifying users in a multi-user environment
---------------------------

If your app wants to identify unique users such as to gather analytics or create other account associations, you should follow the recommended practices for identifying unique installations. By creating a new UUID when your app starts for the first time, you’re certain to obtain a unique ID for tracking each user, regardless of how many users install your app on a single device. Alternatively, you can save a local token fetched from your server or use the registrations ID provided byGoogle Cloud Messaging.

Beware that if your app requests one of the hardware device identifiers (such as the WiFi MAC address or the SERIALnumber), they will provide the same value for each user because these identifiers are tied to the hardware and not the user. Not to mention the other problems these identifiers introduce as discussed in the Identifying App Installations blog post.

New Global Settings
---------------------------

The system settings have been updated to support multiple users with the addition of Settings.Global. This collection of settings is similar to Settings.Secure settings because they are read-only, but applies globally across all user spaces on the device.

Several existing settings were relocated here from either Settings.System or Settings.Secure. If your app is currently making changes to settings previously defined in Settings.System (such as AIRPLANE_MODE_ON), then you should expect that doing so will no longer work on a device running Android 4.2 or higher if those settings were moved to Settings.Global. You can continue to read settings that are in Settings.Global, but because the settings are no longer considered safe for apps to change, attempting to do so will fail silently and the system will write a warning to the system log when running your app on Android 4.2 or higher.

