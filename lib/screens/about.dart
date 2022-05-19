import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/reakshonz.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);
  // String titleInput;
  // String amountInput;
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final Reakshonz _reakshonz = Get.put(Reakshonz());
  void _showHomeScreen() {
    _reakshonz.setHomeStatus(0);
    Get.toNamed('/home');
  }
  void _showPlayScreen() {
    _reakshonz.setHomeStatus(1);
    Get.toNamed('/home');
  }
  @override
  void initState() {
    if (_reakshonz.authStatus() == RxBool(false)) {
      Get.toNamed('/');
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff000000),
        body: Container(
        padding: const EdgeInsets.all(0),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 600,
            // height: 670,
            decoration: const BoxDecoration(
              color: Color(0xff702C82),
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.keyboard_arrow_left),
                          color: const Color(0xffffffff),
                          iconSize: 30,
                          alignment: Alignment.topLeft,
                          onPressed: _showHomeScreen,
                        ),
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: const Center(
                    child: Text(
                      'ReakShonz',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xffffffff), fontSize: 24),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child:InkWell(
                    onTap: _showPlayScreen,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('icons/152x152.png'),
                    )
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: const Center(
                    child: Text(
                      'This app is purely a proof of concept from Digital Marmalade.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffffffff), height: 1.4, fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 60, right: 60),
                  child: const Center(
                    child: Text(
                      'version: 1.4.3 - local',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xffffffff), fontSize: 14),
                    ),
                  ),
                ),
              ]
            )
          ),
        ),
      )
    );
  }
}
