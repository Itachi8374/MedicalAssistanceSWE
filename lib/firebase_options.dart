// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUnjCpYtM8Bjp91jOM5zwpON7ZKJvb7Qo',
    appId: '1:672260409700:android:d7696d850e17a79835d271',
    messagingSenderId: '672260409700',
    projectId: 'medical-assistant-82bb2',
    storageBucket: 'medical-assistant-82bb2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2_7u9tWy4cEQBK9EnvLQsZZBQ7b6rwCw',
    appId: '1:672260409700:ios:f00fcfa6ce31be9d35d271',
    messagingSenderId: '672260409700',
    projectId: 'medical-assistant-82bb2',
    storageBucket: 'medical-assistant-82bb2.appspot.com',
    iosClientId:
        '672260409700-b2f5q1a2jnuhrudf8pvvo7nmtm11r8mv.apps.googleusercontent.com',
    iosBundleId: 'com.example.medicalApp',
  );
}
