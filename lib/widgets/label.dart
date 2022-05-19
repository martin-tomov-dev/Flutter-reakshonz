import 'package:flutter/material.dart';

class Labels extends StatefulWidget {
  const Labels({Key? key, this.label = '', this.topPadding = 0})
      : super(key: key);

  final String label;
  final double topPadding;
  @override
  _Labels createState() => _Labels();
}

class _Labels extends State<Labels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      constraints: const BoxConstraints(maxWidth: 420, minWidth: 50),
      padding: EdgeInsets.only(top: widget.topPadding, right: 40, left: 40),
      child: Text(
        widget.label,
        textAlign: TextAlign.right,
        style: const TextStyle(color: Color(0xff702C82), fontSize: 14),
      ),
    );
  }
}
