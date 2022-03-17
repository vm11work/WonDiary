import 'package:flutter/material.dart';
import 'dart:math' as math;


class Arcs_Painter extends CustomPainter {
  Arcs_Painter(this.n,this.title);
  final n;
  final title;

  @override
  void paint(Canvas canvas, Size size) {
    // Border.all(width: 5.0, color: const Color(0xFFFFFFFF));

    final myPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 1;

    canvas.drawRect(Offset(0,0) & size, myPaint);
    // canvas.drawRect(Offset(100, 100) & size, myPaint);

    canvas.drawCircle(Offset(75,75),50,myPaint);
    canvas.drawLine(Offset.zero, Offset(20,20),Paint());
    canvas.drawRect(
      Rect.fromPoints(Offset.zero,Offset(50,50)),
      Paint(),
    );
    // Paint();
  }

  @override
  bool shouldRepaint(Arcs_Painter old)
  {
    return n != old.n;//n이 달라지면 repaint.
  }
}
