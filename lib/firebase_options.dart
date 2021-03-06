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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCfDDBH6sjX0GoQr-x3hAeNbUrTmtp_VdA',
    appId: '1:1031014109547:web:740ba9ae07f4601fe83c2e',
    messagingSenderId: '1031014109547',
    projectId: 'reakshonz',
    authDomain: 'reakshonz.firebaseapp.com',
    storageBucket: 'reakshonz.appspot.com',
    measurementId: 'G-ZKCQEELD0E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHliFZyGTvKYs3jPkHMLJzhKZvXd4dK7w',
    appId: '1:1031014109547:android:0e569f351bfce8d0e83c2e',
    messagingSenderId: '1031014109547',
    projectId: 'reakshonz',
    storageBucket: 'reakshonz.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAv7LDvSqOUzxhsJZ9fAFzZ_VT-IUggXkg',
    appId: '1:1031014109547:ios:de8dd1e13e9dbed5e83c2e',
    messagingSenderId: '1031014109547',
    projectId: 'reakshonz',
    storageBucket: 'reakshonz.appspot.com',
    iosClientId: '1031014109547-kq2agk8lrvanb0lm49qm0o590ep4b8ml.apps.googleusercontent.com',
    iosBundleId: 'com.example.reakshonz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAv7LDvSqOUzxhsJZ9fAFzZ_VT-IUggXkg',
    appId: '1:1031014109547:ios:de8dd1e13e9dbed5e83c2e',
    messagingSenderId: '1031014109547',
    projectId: 'reakshonz',
    storageBucket: 'reakshonz.appspot.com',
    iosClientId: '1031014109547-kq2agk8lrvanb0lm49qm0o590ep4b8ml.apps.googleusercontent.com',
    iosBundleId: 'com.example.reakshonz',
  );
}
