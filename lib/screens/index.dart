import 'package:flutter/material.dart';
import 'package:reakshonz/screens/detail.dart';
import 'package:get/get.dart';
import '../state/reakshonz.dart';
import './home.dart';
import './account.dart';
import './play.dart';
import './detail.dart';
import '../widgets/dot.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  // String titleInput;
  // String amountInput;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // HomeScreen();
  final Reakshonz _reakshonz = Get.put(Reakshonz());
  @override
  void initState() {
    if (_reakshonz.authStatus() == RxBool(false)) {
     Get.toNamed('/');
    }
    setIndex(_reakshonz.getHomeStatus());
    super.initState();
  }

  int _selectedIndex = 0;
  StatefulWidget mainContain = HomeScreen(onScreenChange: ((id) => {}));

  void setIndex(int value) {
    switch (value) {
      case 3:
        mainContain = const DetailScreen();
        break;
      case 2:
        mainContain = const AccountScreen();
        break;
      case 0:
        mainContain = HomeScreen(onScreenChange: _onItemTapped);
        break;
      case 1:
        mainContain = const PlayScreen();
        break;
      default:
    }
    if (value < 3) {
      setState(() {
        _selectedIndex = value;
      });
    }
  }

  void _onItemTapped(int index) {
    setIndex(index);
    _reakshonz.setHomeStatus(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainContain,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff702C82),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  if (_selectedIndex == 0)
                  const Dot(),
                  const Icon(Icons.home),
                ],
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  if (_selectedIndex == 1)
                  const Dot(),
                  const Icon(Icons.support_rounded),
                ],
              ),
            ),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  if (_selectedIndex == 2)
                  const Dot(),
                  const Icon(Icons.account_circle),
                ],
              ),
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffffffff),
        onTap: _onItemTapped,
      ),
    );
  }
}
