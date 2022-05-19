import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../state/reakshonz.dart';
import '../widgets/title.dart';
import '../widgets/label.dart';
import '../widgets/text_filed.dart';
import '../widgets/sign_button.dart';

class DetailScreen extends StatefulWidget {

  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailScreen> {
  final Reakshonz _reakshonz = Get.put(Reakshonz());
  final nameController = TextEditingController();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  bool _show = false;
  void _showAccount() {
    _reakshonz.setHomeStatus(2);
    Get.toNamed('/home');
  }

  void _updateUser() async {
    await _users.doc(_reakshonz.user.id).update({"name": nameController.text});
    _reakshonz.setHomeStatus(2);
    _reakshonz.updateUser(nameController.text);
    _showNotification();
    Future.delayed(const Duration(milliseconds: 1200), _hideNotification);
  }

  void _showNotification() {
    setState(() {
      _show = true;
    });
  }

  void _hideNotification() {
    setState(() {
      _show = false;
    });
  }

  @override
  void initState() {
    if (_reakshonz.authStatus == RxBool(false)) {
      Get.toNamed('/');
    }
    nameController.text = _reakshonz.user.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff702C82),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.only(top: 30),
                width: 600,
                decoration: const BoxDecoration(color: Color(0xff000000)),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.keyboard_arrow_left),
                            color: const Color(0xff702C82),
                            iconSize: 30,
                            alignment: Alignment.topLeft,
                            onPressed: _showAccount,
                          ),
                        ],
                      )
                    ),
                    const Titles(
                      title: "Your details",
                      topPadding: 15,
                    ),
                    const Labels(
                      label: "Display name",
                      topPadding: 25,
                    ),
                    Textfields(
                      controller: nameController,
                      obscureText: false,
                    ),
                    SignButton(
                      callback: () => _updateUser(),
                      text: "UPDATE",
                      topPadding: 20,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _show,
              child: GestureDetector(
                onTapDown: (details) => _hideNotification,
                child: Container(
                  color: const Color(0xff702C82),
                  padding: const EdgeInsets.all(0),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Thank you",
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                ),
              )
            )
          ],
        )
      )
    );
  }
}
