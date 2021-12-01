<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Starlight Notification

The easiest way to show notification.

## Features

☑️ Show Notification <br>
☑️ Cancel Notification <br>
☑️ Cancel All Notification <br>

Watch the video<br>

![Watch the video](https://user-images.githubusercontent.com/26484667/144256397-2166734f-b7a0-4d90-9052-5d41e79fb6e2.mp4)

## Installation

Add starlight_notification as dependency to your pubspec file.

```dart
starlight_notification: 
    git:
      url: https://github.com/YeMyoAung/starlight_notification.git
```

## Android Setup 

You need to put ic_launcher into app/src/main/res/drawable folder.

Screenshot<br>

<img src="https://user-images.githubusercontent.com/26484667/144252740-0c041771-d28a-4cf1-8f4b-ce403342c295.jpg" width="600" height="600" />

add the following attributes to the activity

```xml
   <activity
    android:showWhenLocked="true"
    android:turnScreenOn="true">
```

Ios Setup

Add the following lines to the didFinishLaunchingWithOptions method in the AppDelegate.swift file of your iOS project

```swift
if #available(iOS 10.0, *) {
  UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
}
```

## Usage

First of all you need to import our package.

```dart
import 'package:starlight_notification/starlight_notification.dart';
```

## Initializing StarlightNotification

To initialize StarlightNotificationService, call the instance method on the StarlightNotificationService class:

```dart
 await StarlightNotificationService.setup();
```

you can also pass this callback

```dart
 await StarlightNotificationService.setup(
    onSelectNotification: (e){
      ///ToDo
    }
  );
```

And then you can invoke anytime,anywhere when you need.You can also use with firebasemessaging.


## Show Notification

```dart
import 'package:flutter/material.dart';
import 'package:starlight_notification/starlight_notification.dart';

Future<void> main() async {
  ///important
  WidgetsFlutterBinding.ensureInitialized();

  ///important
  await StarlightNotificationService.setup(
    onSelectNotification: (e){
      ///ToDo
    }
  );

  ///and then you can invoke anytime,anywhere when you need
  ///you can also use with firebasemessaging

  ///show notification
  await StarlightNotificationService.show(
    StarlightNotification(
      title: 'hello',
      body: 'hi',
      payload: '{"name":"mg mg","age":20}',
    ),
  );
}
```

## Cancel Notification

```dart
import 'package:flutter/material.dart';
import 'package:starlight_notification/starlight_notification.dart';

Future<void> main() async {
  ///important
  WidgetsFlutterBinding.ensureInitialized();

  ///important
  await StarlightNotificationService.setup(
    onSelectNotification: (e){
      ///ToDo
    }
  );

  ///and then you can invoke anytime,anywhere when you need
  ///you can also use with firebasemessaging

  ///cancel notification
  await StarlightNotificationService.cancel('hello');
}


```

## Cancel All Notification

```dart
import 'package:flutter/material.dart';
import 'package:starlight_notification/starlight_notification.dart';

Future<void> main() async {
  ///important
  WidgetsFlutterBinding.ensureInitialized();

  ///important
  await StarlightNotificationService.setup(
    onSelectNotification: (e){
      ///ToDo
    }
  );

  ///and then you can invoke anytime,anywhere when you need
  ///you can also use with firebasemessaging

  ///cancel all notification
  await StarlightNotificationService.cancelAll();
}

```

## Contact Us

[Starlight Studio](https://www.facebook.com/starlightstudio.of/)
