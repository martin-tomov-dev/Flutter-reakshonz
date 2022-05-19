import 'package:flutter/material.dart';

class Titles extends StatefulWidget {
  const Titles({
    Key? key,
    this.title = '', this.topPadding = 75
  }) : super(key: key);

  final String title;
  final double topPadding;
  @override
  _Titles createState() => _Titles();
}

class _Titles extends State<Titles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      constraints: const BoxConstraints(maxWidth: 420, minWidth: 50),
      padding: EdgeInsets.only(top: widget.topPadding, right: 40, left: 40),
      child: Text(
        widget.title,
        textAlign: TextAlign.right,
        style: const TextStyle(color: Color(0xff702C82), fontSize: 24),
      ),
    );
  }
}
