import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import '../widgets/title.dart';
import '../widgets//warning.dart';
import '../widgets/label.dart';
import '../widgets/text_filed.dart';
import '../widgets/sign_button.dart';
import '../state/reakshonz.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpScreen> {
  final Reakshonz _reakshonz = Get.put(Reakshonz());
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String error = "";
  void _showHomeScreen() async {
    final bool isValid = EmailValidator.validate(emailController.text);
    if (emailController.text != '' &&
        passController.text != '' &&
        nameController.text != '') {
      if (isValid) {
        final user = await _users.add({
          "name": nameController.text,
          "email": emailController.text,
          "password": passController.text,
          "latestscore": "0",
          "bestscore": "0",
          "version": "1.4.3"
        });
        _reakshonz.setUser(nameController.text, emailController.text, user.id, "", "");
        Get.toNamed('/home');
      } else {
        setState(() {
          error = "emailValid";
        });
      }
    } else {
      if (isValid) {
        setState(() {
          error = "emailValid";
        });
      }
      if (nameController.text == '') {
        setState(() {
          error = "name";
        });
      } else {
        if (emailController.text == '') {
          setState(() {
            error = "email";
          });
        } else {
          if (passController.text == '') {
            setState(() {
              error = "password";
            });
          }
        }
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
            decoration: const BoxDecoration(color: Color(0xff000000)),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                const Titles(title: "Register for an account"),
                const Labels(
                  label: "Display name",
                  topPadding: 35,
                ),
                Column(
                  children: <Widget>[
                    if (error == "name")
                      const Warnings(
                        text: "Display name is a required field",
                        topPadding: 5,
                      )
                  ],
                ),
                Textfields(
                  controller: nameController,
                  obscureText: false,
                ),
                const Labels(
                  label: "Email address",
                  topPadding: 10,
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
                  text: "CONTINUE",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 35, right: 40, left: 40),
                    child: const Text(
                      'Already signed up? Log in now',
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
