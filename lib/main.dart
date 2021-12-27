import 'package:flutter/material.dart';

import 'Screens/AuthPage.dart';

void main() {
  runApp(IITMadras());
}

class IITMadras extends StatelessWidget {
  const IITMadras({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}