import 'package:flutter/material.dart';

class SignButton extends StatefulWidget {
  const SignButton({Key? key, this.text = '', this.topPadding = 35, required this.callback})
      : super(key: key);

  final String text;
  final double topPadding;
  final VoidCallback callback;
  @override
  _SignButton createState() => _SignButton();
}

class _SignButton extends State<SignButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 420, minWidth: 50),
      padding: EdgeInsets.only(top: widget.topPadding, right: 40, left: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xff702C82),
            minimumSize: const Size.fromHeight(50),
            padding: const EdgeInsets.all(24),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ))),
        onPressed: widget.callback,
        child: Text(
          widget.text,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 1,
              color: Color(0xffffffff)),
        ),
      ),
    );
  }
}
