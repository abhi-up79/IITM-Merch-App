import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/AuthPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'BeVietnamPro',
          appBarTheme: AppBarTheme(backgroundColor: Color(0xff79201B))),
      home: AuthPage(),
    );
  }
}
