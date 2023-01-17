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
    apiKey: 'AIzaSyCbRuxW8OLNgOn0sJmRLldCSi0AJy34itE',
    appId: '1:1072792626848:web:3bec824ca7f549e6848bc5',
    messagingSenderId: '1072792626848',
    projectId: 'asroo-9806e',
    authDomain: 'asroo-9806e.firebaseapp.com',
    storageBucket: 'asroo-9806e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBArOo3mm9J19Ja4HSkRKFQNmA-a87l8fs',
    appId: '1:1072792626848:android:f08905bbfccb4054848bc5',
    messagingSenderId: '1072792626848',
    projectId: 'asroo-9806e',
    storageBucket: 'asroo-9806e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyVJygEk0L8C0TSuvJI658k_lfqO-8NtY',
    appId: '1:1072792626848:ios:9427651e0490360f848bc5',
    messagingSenderId: '1072792626848',
    projectId: 'asroo-9806e',
    storageBucket: 'asroo-9806e.appspot.com',
    iosClientId: '1072792626848-allb654pm02tmp6qbnso2ma8pmd16h8a.apps.googleusercontent.com',
    iosBundleId: 'com.example.asroo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyVJygEk0L8C0TSuvJI658k_lfqO-8NtY',
    appId: '1:1072792626848:ios:9427651e0490360f848bc5',
    messagingSenderId: '1072792626848',
    projectId: 'asroo-9806e',
    storageBucket: 'asroo-9806e.appspot.com',
    iosClientId: '1072792626848-allb654pm02tmp6qbnso2ma8pmd16h8a.apps.googleusercontent.com',
    iosBundleId: 'com.example.asroo',
  );
}