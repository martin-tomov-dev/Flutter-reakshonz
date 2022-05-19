import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

class Round extends StatefulWidget {
  const Round(
      {Key? key, this.opacity = 0.5, this.width = 0, required this.callback})
      : super(key: key);

  final Function callback;
  final double opacity;
  final double width;
  // String titleInput;
  // String amountInput;
  @override
  _Round createState() => _Round();
}

class _Round extends State<Round> {
  bool plusShow = false;
  double posx = 100.0;
  double posy = 100.0;
  void _setPlusHide() {
    setState(() {
      plusShow = false;
    });
  }

  void onTapDown(BuildContext context, TapDownDetails details) {
    if (widget.opacity == 1) {
      final RenderBox box = context.findRenderObject() as RenderBox;
      final Offset localOffset = box.globalToLocal(details.globalPosition);
      setState(() {
        plusShow = true;
      });
      Future.delayed(const Duration(milliseconds: 500), _setPlusHide);
      setState(() {
        posx = localOffset.dx - 6.5;
        posy = localOffset.dy - 15;
      });
      // print((localOffset.dx - widget.width/2).abs() - 2.2);
      // print((localOffset.dy - widget.width/2).abs() - 2.2);
      var length = sqrt(pow(((widget.width / 2 - 2.2 - (localOffset.dx).abs())), 2) + pow(((widget.width / 2 - 2.2 - (localOffset.dy).abs()).abs()), 2));
      var percent = (100 - length / 2 / (widget.width / 2 - 2.2) * 100).abs();
      widget.callback(percent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.all(0),
                child: GestureDetector(
                  onTapDown: (TapDownDetails details) =>
                      onTapDown(context, details),
                  child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color:
                            const Color(0xff52C7EB).withOpacity(widget.opacity),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Center(
                          child: FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff)
                                .withOpacity(widget.opacity),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Center(
                              child: FractionallySizedBox(
                            widthFactor: 0.4,
                            heightFactor: 0.4,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffF17B2D)
                                    .withOpacity(widget.opacity),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                              ),
                            ),
                          )),
                        ),
                      ))),
                )),
            Positioned(
                left: posx,
                top: posy,
                child: Visibility(
                  visible: plusShow,
                  child: const Text(
                    '+',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ))
          ],
        ));
  }
}
