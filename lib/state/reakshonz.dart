import 'package:get/get.dart';
import '../models/user.dart';

class Reakshonz extends GetxController {
  User user = User(name: "", email: "", id: "", latestscore: "", bestscore: "");
  int homeStatus = 1;
  RxBool _auth = RxBool(false);
  String bg = "";

  void setUser(String name, String email, String id, String latestscore,
      String bestscore) {
    _auth = RxBool(true);
    user = User(
        name: name,
        email: email,
        id: id,
        latestscore: latestscore,
        bestscore: bestscore);
    if (bestscore == latestscore) {
      bg = "assets/bg-gameplay.png";
    } else {
      bg = "";
    }
  }

  void updateUser(String name) {
    user = User(
        name: name,
        id: user.id,
        email: user.email,
        latestscore: user.latestscore,
        bestscore: user.bestscore);
  }

  void updateScore(String score) {
    bg = "";
    user = User(
        name: user.name,
        id: user.id,
        email: user.email,
        latestscore: score,
        bestscore: user.bestscore);
  }

  void updateBestScore(String score) {
    bg = "assets/bg-gameplay.png";
    user = User(
        name: user.name,
        id: user.id,
        email: user.email,
        latestscore: user.latestscore,
        bestscore: score);
  }

  User getUserInfo() {
    return user;
  }

  int getHomeStatus() {
    return homeStatus;
  }

  RxBool authStatus() {
    return _auth;
  }

  void setHomeStatus(int value) {
    homeStatus = value;
  }
}
