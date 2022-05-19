import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../widgets/round.dart';
import 'dart:async';
import 'dart:math';
import '../state/reakshonz.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final Reakshonz _reakshonz = Get.put(Reakshonz());
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  int _selectItem = 0;
  int _duration = 0;
  int _randomCount = 0;
  bool _start = false;
  bool _count = false;
  String _center = '';
  String _mark = '';
  String _time = '';
  double _totalMark = 0;
  final List<double> _arrOpacity = [
    0.5,
    0.5,
    0.5,
    0.5,
    0.5,
    0.5,
    0.5,
    0.5,
    0.5,
    0.5
  ];
  final List<int> _arrNum = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  void _hideStart() {
    setState(() {
      _start = true;
    });

    Future.delayed(const Duration(milliseconds: 1000), changeOpacity);
  }

  void changeOpacity() {
    if (_randomCount < 10 && _reakshonz.homeStatus == 1) {
      setState(() {
        _randomCount++;
      });
      setState(() {
        if (_randomCount < 10) {
          _selectItem = _arrNum[Random().nextInt(10 - _randomCount)];
        } else {
          _selectItem = Random().nextInt(10);
        }
        _count = true;
      });
      setState(() {
        _arrOpacity[_selectItem] = 1;
        _arrNum.remove(_selectItem);
      });
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        if (_count == false) {
          timer.cancel();
          setState(() {
            _duration = 0;
          });
        } else {
          setState(() {
            _duration = _duration + 2;
          });
        }
      });
    }
  }

  void defaultFormat() {
    if (_reakshonz.homeStatus == 1 && _randomCount < 10) {
      setState(() {
        _center = "";
        _mark = "";
        _time = "";
      });
    }
  }

  void setPercent(value) async {
    setState(() {
      _count = false;
    });
    setState(() {
      _arrOpacity[_selectItem] = 0.5;
    });
    setState(() {
      _center = value.toString().substring(0, 4);
    });
    if (_duration < 30) {
      setState(() {
        _time = ((30 - _duration) / 30 * 100).toStringAsFixed(1);
      });
    } else {
      setState(() {
        _time = "0";
      });
    }
    if (_time == "0" || value == 0) {
      setState(() {
        _mark = '0';
      });
    } else {
      var markValue = (((30 - _duration) / 30 * 100) + value) / 2 * 1000;

      setState(() {
        _totalMark += markValue;
        _mark =
            '${markValue.toString().substring(0, 2)},${markValue.toString().substring(2, 5)}';
      });
    }
    if (_randomCount == 10) {
      await _users
          .doc(_reakshonz.user.id)
          .update({"latestscore": (_totalMark).toStringAsFixed(0)});
      _reakshonz.updateScore((_totalMark).toStringAsFixed(0));
      if (double.parse((_totalMark).toString()) >
          double.parse(_reakshonz.user.bestscore)) {
        await _users
            .doc(_reakshonz.user.id)
            .update({"bestscore": (_totalMark).toStringAsFixed(0)});
        _reakshonz.updateBestScore((_totalMark).toStringAsFixed(0));
      }
      Get.toNamed('/score');
    }
    Future.delayed(const Duration(milliseconds: 2600), changeOpacity);
    Future.delayed(const Duration(milliseconds: 800), defaultFormat);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 600,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.grey,
                padding: const EdgeInsets.all(0),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          left: 20, top: 15, bottom: 15),
                      child: Visibility(
                        visible: _center != '',
                        child: Text(
                          '$_center%',
                          style: const TextStyle(
                              fontSize: 24, color: Color(0xffc1c1c1)),
                        ),
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: Visibility(
                        visible: _mark != '',
                        child: Text(
                          '+$_mark',
                          style: const TextStyle(
                              fontSize: 24, color: Color(0xffffffff)),
                        ),
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: Visibility(
                        visible: _time != '',
                        child: Text(
                          '$_time%',
                          style: const TextStyle(
                              fontSize: 24, color: Color(0xffc1c1c1)),
                        ),
                      )
                    ),
                  ],
                ),
              ),
              Container(
                width: 1000,
                padding: const EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 600,
                    height: 670,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 160, maxWidth: 160),
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.3,
                                  child: Round(
                                      opacity: _arrOpacity[0],
                                      width: screenWidth * 0.3,
                                      callback: (value) => setPercent(value)),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 160, maxWidth: 160),
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.3,
                                  child: Round(
                                      opacity: _arrOpacity[1],
                                      width: screenWidth * 0.3,
                                      callback: (value) => setPercent(value)),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 160, maxWidth: 160),
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.3,
                                  child: Round(
                                      opacity: _arrOpacity[2],
                                      width: screenWidth * 0.3,
                                      callback: (value) => setPercent(value)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 160, maxWidth: 160),
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.3,
                                  child: Round(
                                      opacity: _arrOpacity[3],
                                      width: screenWidth * 0.3,
                                      callback: (value) => setPercent(value)),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 160, maxWidth: 160),
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.3,
                                  child: Round(
                                      opacity: _arrOpacity[4],
                                      width: screenWidth * 0.3,
                                      callback: (value) => setPercent(value)),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 160, maxWidth: 160),
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.3,
                                  child: Round(
                                      opacity: _arrOpacity[5],
                                      width: screenWidth * 0.3,
                                      callback: (value) => setPercent(value)),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 160, maxWidth: 160),
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.3,
                                  child: Round(
                                      opacity: _arrOpacity[6],
                                      width: screenWidth * 0.3,
                                      callback: (value) => setPercent(value)),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 160, maxWidth: 160),
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.3,
                                  child: Round(
                                      opacity: _arrOpacity[7],
                                      width: screenWidth * 0.3,
                                      callback: (value) => setPercent(value)),
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: 160, maxWidth: 160),
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.3,
                                  child: Round(
                                      opacity: _arrOpacity[8],
                                      width: screenWidth * 0.3,
                                      callback: (value) => setPercent(value)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Visibility(
                          visible: !_start,
                          child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              width: 600,
                              height: 670,
                              alignment: Alignment.center,
                              child: Container(
                                width: 186,
                                height: 50,
                                margin: const EdgeInsets.only(top: 10),
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      40.0),
                                              side: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 2)))),
                                  onPressed: _hideStart,
                                  child: const Text(
                                    'START',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        color: Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            ),
                          )
                        )
                      ],
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
