// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDdyeKIDUbiby_36g-_GG1B0HLvOJ3EiRA',
    appId: '1:449223757277:web:a542be97cebc65c74f7a34',
    messagingSenderId: '449223757277',
    projectId: 'pokedex-franq',
    authDomain: 'pokedex-franq.firebaseapp.com',
    storageBucket: 'pokedex-franq.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcSTeCSqcfAPN8eGdyXqZnPIAvHeEwDI8',
    appId: '1:449223757277:android:ea97d9f60dbb3d1b4f7a34',
    messagingSenderId: '449223757277',
    projectId: 'pokedex-franq',
    storageBucket: 'pokedex-franq.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTS9gdt2HvAug9LbuEmcWr1pf2MOyRlHI',
    appId: '1:449223757277:ios:028b3fa7b97c75154f7a34',
    messagingSenderId: '449223757277',
    projectId: 'pokedex-franq',
    storageBucket: 'pokedex-franq.appspot.com',
    iosClientId: '449223757277-9ml68u1mevge2kardmcsppgopb0q4160.apps.googleusercontent.com',
    iosBundleId: 'com.franq.pokedex',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTS9gdt2HvAug9LbuEmcWr1pf2MOyRlHI',
    appId: '1:449223757277:ios:028b3fa7b97c75154f7a34',
    messagingSenderId: '449223757277',
    projectId: 'pokedex-franq',
    storageBucket: 'pokedex-franq.appspot.com',
    iosClientId: '449223757277-9ml68u1mevge2kardmcsppgopb0q4160.apps.googleusercontent.com',
    iosBundleId: 'com.franq.pokedex',
  );
}
