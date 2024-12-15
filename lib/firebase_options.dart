// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBwyej9oTWFevNdUNSLGt-kxbyWU1Pg7OQ',
    appId: '1:868728431563:web:16756ba7deca7b9bedcc4e',
    messagingSenderId: '868728431563',
    projectId: 'app-log1',
    authDomain: 'app-log1.firebaseapp.com',
    databaseURL: 'https://app-log1-default-rtdb.firebaseio.com',
    storageBucket: 'app-log1.firebasestorage.app',
    measurementId: 'G-CHCSF609T8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbbByX8UUrwc8vSkxYgtZTWuGk4eS9Dqc',
    appId: '1:868728431563:android:dfd2294bb2c2b5baedcc4e',
    messagingSenderId: '868728431563',
    projectId: 'app-log1',
    databaseURL: 'https://app-log1-default-rtdb.firebaseio.com',
    storageBucket: 'app-log1.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDXev9YL6wRkdXVezshxFxXiBRwXFm37BE',
    appId: '1:868728431563:web:3a65a9476169fdacedcc4e',
    messagingSenderId: '868728431563',
    projectId: 'app-log1',
    authDomain: 'app-log1.firebaseapp.com',
    databaseURL: 'https://app-log1-default-rtdb.firebaseio.com',
    storageBucket: 'app-log1.firebasestorage.app',
    measurementId: 'G-J9SDWL5QZ4',
  );
}