import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_paint.dart';


class BezierContainer extends StatelessWidget {
  const BezierContainer({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
          angle: -pi / 0.1,
          child: ClipPath(
            clipper: ClipPainter(),
            child: Container(
              height: MediaQuery.of(context).size.height -178,
              width: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF1E355F).withOpacity(0.7),
                        Color(0xFF1E355F),
                      ]
                  )
              ),
            ),
          ),
        )
    );
  }
}