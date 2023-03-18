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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD3fZXDA7xj4uggFhb-HmrlzjThARfNh7w',
    appId: '1:708783659998:web:71520027962e042466db4f',
    messagingSenderId: '708783659998',
    projectId: 'teamlink-67801',
    authDomain: 'teamlink-67801.firebaseapp.com',
    databaseURL: 'https://teamlink-67801-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'teamlink-67801.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6rgPCGRf0Oauoh9g8FtoRI6rw8WhGlIU',
    appId: '1:708783659998:android:eea5c96c9a783c2066db4f',
    messagingSenderId: '708783659998',
    projectId: 'teamlink-67801',
    databaseURL: 'https://teamlink-67801-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'teamlink-67801.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdkfr6X7Ue702OlGWN4dYRisuqU_RpTsA',
    appId: '1:708783659998:ios:6aeb1bfae5eeb79c66db4f',
    messagingSenderId: '708783659998',
    projectId: 'teamlink-67801',
    databaseURL: 'https://teamlink-67801-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'teamlink-67801.appspot.com',
    iosClientId: '708783659998-v2b4mp007phjflign18if9n8k7fo4b9o.apps.googleusercontent.com',
    iosBundleId: 'com.teamlink.adgHackathon',
  );
}
