import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({Key? key, this.text = '', this.topPadding = 0, required this.callback})
      : super(key: key);

  final String text;
  final double topPadding;
  final VoidCallback callback;
  @override
  _HomeButton createState() => _HomeButton();
}

class _HomeButton extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 186,
      height: 50,
      margin: EdgeInsets.only(top: widget.topPadding),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xff000000)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    side:
                        const BorderSide(color: Color(0xff702C82), width: 2)))),
        onPressed: widget.callback,
        child: Text(
          widget.text,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 1,
              color: Color(0xff702C82)),
        ),
      ),
    );
  }
}
