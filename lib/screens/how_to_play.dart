import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/reakshonz.dart';

class HowToPlayScreen extends StatefulWidget {
  
  const HowToPlayScreen({Key? key}) : super(key: key);

  @override
  _HowToPlayScreenState createState() => _HowToPlayScreenState();
}

class _HowToPlayScreenState extends State<HowToPlayScreen> {
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
              decoration: const BoxDecoration(color: Color(0xff702C82)),
              alignment: Alignment.center,
              child: Column(children: <Widget>[
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
                      style:
                          TextStyle(color: Color(0xffffffff), fontSize: 24),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: InkWell(
                      onTap: _showPlayScreen,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('icons/152x152.png'),
                      )),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: const Center(
                    child: Text(
                      'ReakShonz is a simple yet addictive game that tests your reactions.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          height: 1.4),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: const Center(
                    child: Text(
                      'Targets light up one at a time and you need to tap them as quickly as possible.  The closer you are to the centre of a target and the quicker you respond, the more points you will receive.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          height: 1.4),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: const Center(
                    child: Text(
                      "A maximum of 50,000 points is available for accuaracy and another 50,000 for speed; that's a whopping 100,000 points on offer per target!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          height: 1.4),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: const Center(
                    child: Text(
                      'Each of the 9 targets will light up in a random order and then a final 10th target will light up.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          height: 1.4),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: const Center(
                    child: Text(
                      'How close to 1,000,000 points can you get?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          height: 1.4),
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
