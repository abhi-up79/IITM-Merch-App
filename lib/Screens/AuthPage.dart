import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iit_madras_merchandise/Screens/CreateProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iit_madras_merchandise/Screens/ProductCatlog.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = new GoogleSignIn();
  GoogleSignInAccount? signedAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff79201B),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 150,
                child: Image.asset(
                  "assets/Icons/logo.png",
                  scale: 6,
                )),
            const Positioned(
              top: 300,
              child: Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Text("IIT Madras",
                    style: TextStyle(
                        color: Color(0xffD7A74F),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather')),
              ),
            ),
            const Positioned(
              top: 420,
              child: Text("Merchandise Store",
                  style: TextStyle(
                      color: Color(0xffD7A74F),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Merriweather')),
            ),
            Positioned(
              bottom: 100,
              child: Padding(
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
                    onPressed: () async {
                      await googleSignIn.signOut();
                      try {
                        signedAccount = await googleSignIn.signIn();
                        if (signedAccount != null) {
                          debugPrint("Authentication Successful");
                          print('Signed In from ${signedAccount!.email}');
                          GoogleSignInAuthentication gauth =
                              await signedAccount!.authentication;
                          final AuthCredential credential =
                              GoogleAuthProvider.credential(
                            accessToken: gauth.accessToken,
                            idToken: gauth.idToken,
                          );
                          UserCredential login =
                              await auth.signInWithCredential(credential);
                          if (login != null) {
                            //Query
                            FirebaseAuth auth = FirebaseAuth.instance;
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;
                            await firestore
                                .collection('Users')
                                .where('email',
                                    isEqualTo: auth.currentUser!.email)
                                .get()
                                .then((value) {
                              debugPrint(value.docs.length.toString());
                              if (value.docs.length == 0) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CreateProfilePage()));
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ProductCatlog()));
                              }
                            });
                          } else {
                            await googleSignIn.signOut();
                            await auth.signOut();
                          }
                        } else {
                          debugPrint("Authentication Failed");
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text("Sign In with Google",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
              ),
            ),
            const Positioned(
              bottom: 10,
              child: Text("Copyrights Reserved 2021 Flutterathon",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
