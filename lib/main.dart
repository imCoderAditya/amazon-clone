import 'package:amazon_clone/layout/layout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCQ8JdOcx-68hSlHbA6o2NcxEekDFz6yhg",
          authDomain: "clone-d2d90.firebaseapp.com",
          projectId: "clone-d2d90",
          storageBucket: "clone-d2d90.appspot.com",
          messagingSenderId: "308870861490",
          appId: "1:308870861490:web:32e0863ddb80372d472fab",
          measurementId: "G-KC60LFW13S"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final storage = FlutterSecureStorage();
  Future<bool> checkSignInMethod() async {
    String? value = await storage.read(key: "uid");
    if (value == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon Title",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      themeMode: ThemeMode.system,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ScreenLayout();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
