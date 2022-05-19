import 'package:flutter/material.dart';

class AccountButton extends StatefulWidget {
  const AccountButton(
      {Key? key, this.text = '', this.topPadding = 35, required this.callback})
      : super(key: key);

  final String text;
  final double topPadding;
  final VoidCallback callback;
  @override
  _AccountButton createState() => _AccountButton();
}

class _AccountButton extends State<AccountButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.topPadding),
      constraints: const BoxConstraints(maxWidth: 600),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          minimumSize: const Size.fromHeight(50),
          padding: const EdgeInsets.all(26),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            )
          )
        ),
        onPressed: widget.callback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.text,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 1,
                    color: Color(0xff702C82)),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.topRight,
              child: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 20.0,
              ),
            ),
          ],
        )
      ),
    );
  }
}
