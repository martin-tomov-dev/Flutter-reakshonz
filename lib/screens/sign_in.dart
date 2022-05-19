import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../widgets/title.dart';
import '../widgets/warning.dart';
import '../widgets/label.dart';
import '../widgets/text_filed.dart';
import '../widgets/sign_button.dart';
import '../state/reakshonz.dart';

class SignScreen extends StatefulWidget {
  @override
  const SignScreen({Key? key}) : super(key: key);
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignScreen> {
  final emailController = TextEditingController();
  final Reakshonz _reakshonz = Get.put(Reakshonz());
  final passController = TextEditingController();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  String error = "";
  bool login = false;

  void _showHomeScreen() async {
    if (emailController.text != '' && passController.text != '') {
      final bool isValid = EmailValidator.validate(emailController.text);
      if (isValid == true) {
        await _users.get().then((event) {
          for (var doc in event.docs) {
            final jsonData = json.decode(json.encode(doc.data()));
            if (jsonData['email'] == emailController.text &&
                jsonData['password'] == passController.text) {
              _reakshonz.setUser(jsonData['name'], jsonData['email'], doc.id, jsonData['latestscore'], jsonData['bestscore']);
              setState(() {
                login = true;
              });
            }
          }
        });
        if (login == true) {
          Get.toNamed('/home');
        } else {
          setState(() {
            error = "combination";
          });
        }
      } else {
        setState(() {
          error = "emailValid";
        });
      }
    } else {
      if (passController.text == '') {
        setState(() {
          error = "password";
        });
      }
      if (emailController.text == '') {
        setState(() {
          error = "email";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff702C82),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 600,
            // height: 670,
            decoration: const BoxDecoration(
              color: Color(0xff000000),
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                const Titles(title: "Log in to your account"),
                Column(
                  children: <Widget>[
                    if (error == "combination")
                      const Warnings(
                        text:
                            "Email address and password combination not found",
                        topPadding: 35,
                      )
                  ],
                ),
                const Labels(
                  label: "Email address",
                  topPadding: 35,
                ),
                Column(
                  children: <Widget>[
                    if (error == "email")
                      const Warnings(
                        text: "email is a required field",
                        topPadding: 5,
                      )
                  ],
                ),
                Column(
                  children: <Widget>[
                    if (error == "emailValid")
                      const Warnings(
                        text: "email is not valid",
                        topPadding: 5,
                      )
                  ],
                ),
                Textfields(
                  controller: emailController,
                  obscureText: false,
                ),
                const Labels(
                  label: "Password",
                  topPadding: 10,
                ),
                Column(
                  children: <Widget>[
                    if (error == "password")
                      const Warnings(
                        text: "password is a required field",
                        topPadding: 5,
                      )
                  ],
                ),
                Textfields(
                  controller: passController,
                  obscureText: true,
                ),
                SignButton(
                  callback: () => _showHomeScreen(),
                  text: "LOG IN",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 35, right: 40, left: 40),
                    child: const Text(
                      'Not got a DM Apps account? Register now',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Color(0xff702C82), fontSize: 14),
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
