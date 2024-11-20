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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyAsZW8konto3eFCYZy1oZIa17ZGx8v-RkE',
    appId: '1:740262914915:web:66ba81932402f9d8f00156',
    messagingSenderId: '740262914915',
    projectId: 'e-commerce-app-12061999',
    authDomain: 'e-commerce-app-12061999.firebaseapp.com',
    storageBucket: 'e-commerce-app-12061999.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDssd7PG4Zii5gGZvGYXttIwVoeQwiG4Nc',
    appId: '1:740262914915:android:4f2d0f284e63a9cef00156',
    messagingSenderId: '740262914915',
    projectId: 'e-commerce-app-12061999',
    storageBucket: 'e-commerce-app-12061999.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxo6axe7UQriqHfuk9wVF2K7VpCsPCvJM',
    appId: '1:740262914915:ios:5205afa79eddf5a6f00156',
    messagingSenderId: '740262914915',
    projectId: 'e-commerce-app-12061999',
    storageBucket: 'e-commerce-app-12061999.firebasestorage.app',
    iosBundleId: 'com.example.socialMediaMitch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxo6axe7UQriqHfuk9wVF2K7VpCsPCvJM',
    appId: '1:740262914915:ios:5205afa79eddf5a6f00156',
    messagingSenderId: '740262914915',
    projectId: 'e-commerce-app-12061999',
    storageBucket: 'e-commerce-app-12061999.firebasestorage.app',
    iosBundleId: 'com.example.socialMediaMitch',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAsZW8konto3eFCYZy1oZIa17ZGx8v-RkE',
    appId: '1:740262914915:web:ffeb4d199b57afc9f00156',
    messagingSenderId: '740262914915',
    projectId: 'e-commerce-app-12061999',
    authDomain: 'e-commerce-app-12061999.firebaseapp.com',
    storageBucket: 'e-commerce-app-12061999.firebasestorage.app',
  );
}
