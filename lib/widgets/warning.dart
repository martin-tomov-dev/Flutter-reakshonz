import 'package:flutter/material.dart';

class Warnings extends StatefulWidget {
  const Warnings({Key? key, this.text = '', this.topPadding = 0}) : super(key: key);

  final String text;
  final double topPadding;
  @override
  _Warnings createState() => _Warnings();
}

class _Warnings extends State<Warnings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      constraints: const BoxConstraints(maxWidth: 420, minWidth: 50),
      padding: EdgeInsets.only(top: widget.topPadding, right: 40, left: 40),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: Color(0xffF04576),
        ),
        padding:
            const EdgeInsets.only(top: 6, bottom: 6, right: 10, left: 10),
        child: Text(
          widget.text,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Color(0xffffffff), fontSize: 14),
        ),
      )
    );
  }
}
