import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/reakshonz.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);
  // String titleInput;
  // String amountInput;
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  final Reakshonz _reakshonz = Get.put(Reakshonz());
  AssetImage bg = const AssetImage("bg-gameplay.png");
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
    if (_reakshonz.user.bestscore == _reakshonz.user.latestscore) {
      setState(() {
        bg = const AssetImage("");
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: const Color(0xff702C82),
          image: DecorationImage(
            image: bg,
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: const Center(
                  child: Text(
                    'YOUR SCORE',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xffffffff), fontSize: 22),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Text(
                    _reakshonz.user.latestscore,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  if (_reakshonz.user.latestscore !=
                      _reakshonz.user.bestscore)
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          'BEST: ${_reakshonz.user.bestscore}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xffffffff), fontSize: 20),
                        ),
                      ),
                    ),
                  if (_reakshonz.user.latestscore ==
                      _reakshonz.user.bestscore)
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: const Center(
                        child: Text(
                          'PERSONAL BEST!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffffffff), fontSize: 20),
                        ),
                      ),
                    ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 60, right: 60),
                child: Center(
                  child: Container(
                    width: 186,
                    height: 50,
                    margin: const EdgeInsets.only(top: 0),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffffffff)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                  side: const BorderSide(
                                      color: Color(0xff702C82), width: 2)))),
                      onPressed: _showPlayScreen,
                      child: const Text(
                        'Play again',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 1,
                            color: Color(0xff702C82)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 60, right: 60),
                child: Container(
                  width: 186,
                  height: 50,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color(0xff702C82)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                    side: const BorderSide(
                                        color: Color(0xffffffff),
                                        width: 2)))),
                    onPressed: _showHomeScreen,
                    child: const Text(
                      'Home',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
            ]
          )
        ),
      )
    );
  }
}
