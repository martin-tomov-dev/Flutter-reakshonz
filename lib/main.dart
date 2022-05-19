// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unused_field, library_private_types_in_public_api, unused_element
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

import 'screens/sign_up.dart';
import 'screens/how_to_play.dart';
import 'screens/about.dart';
import 'screens/sign_in.dart';
import 'screens/detail.dart';
import 'screens/index.dart';
import 'screens/score.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Reakshonz());
}

class Reakshonz extends StatelessWidget {
  const Reakshonz();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SignScreen(),
      getPages: [
        GetPage(name: '/detail', page: () => const DetailScreen()),
        GetPage(name: '/signup', page: () => const SignUpScreen()),
        GetPage(name: '/score', page: () => const ScoreScreen()),
        GetPage(name: '/home', page: () => const MainScreen()),
        GetPage(name: '/howtoplay', page: () => const HowToPlayScreen()),
        GetPage(name: '/about', page: () => const AboutScreen()),
      ],
    );
  }
}