import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/home_button.dart';
import '../state/reakshonz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.onScreenChange}) : super(key: key);
  final Function onScreenChange;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Reakshonz _reakshonz = Get.put(Reakshonz());

  void _showHowToPlayScreen() {
    Get.toNamed('/howtoplay');
  }

  void _showAboutScreen() {
    Get.toNamed('/about');
  }

  void _showPlayScreen() {
    widget.onScreenChange(1);
    _reakshonz.setHomeStatus(1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 600,
          color: const Color(0xff000000),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 75),
                child: const Center(
                  child: Text(
                    'ReakShonz',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff702C82), fontSize: 24),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: InkWell(
                    onTap: _showPlayScreen,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('icons/152x152.png'),
                    ),
                  )),
              HomeButton(
                callback: () => _showHowToPlayScreen(),
                text: "HOW TO PLAY",
                topPadding: 35,
              ),
              HomeButton(
                callback: () => _showAboutScreen(),
                text: "ABOUT",
                topPadding: 10,
              ),
              Container(
                padding: const EdgeInsets.only(top: 75, right: 40, left: 40),
                child: const Center(
                  child: Text(
                    'Your best score:',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xff702C82), fontSize: 24),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 40, left: 40),
                child: Center(
                  child: Text(
                    _reakshonz.user.bestscore,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color(0xff702C82), fontSize: 24),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
