import 'package:flutter/material.dart';

class Dot extends StatefulWidget {
  const Dot({Key? key}) : super(key: key);

  @override
  _Dot createState() => _Dot();
}

class _Dot extends State<Dot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(color: const Color(0xffffffff), borderRadius: BorderRadius.circular(10),),
    );
  }
}
