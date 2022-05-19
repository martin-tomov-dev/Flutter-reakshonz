import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/reakshonz.dart';
import '../widgets/account_button.dart';

class AccountScreen extends StatefulWidget {

  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final Reakshonz _reakshonz = Get.put(Reakshonz());
  void _showSignScreen() {
    _reakshonz.setHomeStatus(0);
    Get.toNamed('/');
  }

  void _showDetailScreen() {
    _reakshonz.setHomeStatus(3);
    Get.toNamed('/detail');
  }

  @override
  Widget build(BuildContext context) {
    final user = _reakshonz.user;
    return Container(
      padding: const EdgeInsets.all(0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 600,
          decoration: const BoxDecoration(color: Color(0xff000000)),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    user.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color(0xff702C82), fontSize: 36),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 0),
                child: Center(
                  child: Text(
                    user.email,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color(0xff702C82), fontSize: 14),
                  ),
                ),
              ),
              AccountButton(
                callback: _showDetailScreen,
                text: "Your Details",
                topPadding: 55,
              ),
              AccountButton(
                callback: _showSignScreen,
                text: "Log out",
                topPadding: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
