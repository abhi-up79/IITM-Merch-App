import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff79201B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/Icons/logo.png"),
          const Padding(
            padding: EdgeInsets.only(top: 80.0),
            child: Text("IIT Madras",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather')),
          ),
          const Text("Merchandise Store",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merriweather')),
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 80),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xffD7A74F)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                    side: MaterialStateProperty.all(
                        const BorderSide(width: 2, color: Colors.white))),
                onPressed: () {},
                child: const Text("Sign In with Google",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          ),
          const Text("Copyrights Reserved 2021 Flutterathon",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    );
  }
}
