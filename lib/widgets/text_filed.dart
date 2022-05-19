import 'package:flutter/material.dart';

class Textfields extends StatefulWidget {
  const Textfields({Key? key, this.obscureText = false, required this.controller})
      : super(key: key);

  final bool obscureText;
  final TextEditingController controller;
  @override
  _Textfields createState() => _Textfields();
}

class _Textfields extends State<Textfields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 40, left: 40),
      constraints: const BoxConstraints(maxWidth: 420, minWidth: 50),
      child: TextFormField(
        autofocus: false,
        obscureText: widget.obscureText,
        controller: widget.controller,
        style: const TextStyle(fontSize: 22.0, color: Color(0xff000000)),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(5.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(5.7),
          ),
        ),
      ),
    );
  }
}
