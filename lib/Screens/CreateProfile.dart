// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({Key? key}) : super(key: key);

  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final GlobalKey<FormState> createProfileKey = new GlobalKey<FormState>();

  String? name;
  String? address;
  String? state;
  String? phone;

  static List<String> states = [
    'Uttar Pradesh',
    'Goa',
    'Bihar',
    'Rajasthan',
    'Kerala'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff79201B),
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "Create Profile",
          // ignore: prefer_const_constructors
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xffD7A74F)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Form(
              key: createProfileKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Text(
                      'Full Name',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Color(0xff79201B))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Color(0xff79201B))),
                        hintText: 'Bob',
                        // labelText: 'Full Name'
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Full name is mandatory';
                        }
                        return null;
                      },
                      onSaved: (name) {
                        this.name = name!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Color(0xff79201B))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Color(0xff79201B))),
                        hintText: '1234567890',
                        // labelText: 'Full Name'
                      ),
                      validator: (phno) {
                        if (phno!.isEmpty) {
                          return 'Phone Number is Mandatory';
                        }
                        if (phno.length != 10) {
                          return 'Invalid Phone Number';
                        }
                        return null;
                      },
                      onSaved: (phno) {
                        this.phone = phno!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Address',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Color(0xff79201B))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Color(0xff79201B))),
                        hintText: 'H.No, Street, city',
                        // labelText: 'Full Name'
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Address is Mandatory';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        this.address = val!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'State',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return states.where((String option) {
                          return option
                              .toLowerCase()
                              .startsWith(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        debugPrint('You just selected $selection');
                        state = selection;
                      },
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xffD7A74F)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                          onPressed: () async {
                            createProfileKey.currentState!.save();
                            if (createProfileKey.currentState!.validate()) {
                              //
                              debugPrint("Successfully Form validated");
                              var udata = {
                                "name": name,
                                "phone": phone,
                                "address": address,
                                "state": state,
                              };
                              FirebaseFirestore firebaseFirestore =
                                  FirebaseFirestore.instance;
                              await firebaseFirestore
                                  .collection('Users')
                                  .add(udata);
                            } else {
                              debugPrint("Please fill the form again");
                            }
                          },
                          child: const Text("Create Profile",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
