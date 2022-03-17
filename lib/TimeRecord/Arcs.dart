import 'package:flutter/material.dart';
import 'trash/MyStore.dart';
import 'package:wondiary/TimeRecord/TimeRecord.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'Arcs_Painter.dart';
import 'dart:math' as math;

class Arcs extends StatefulWidget {
  Arcs({Key? key}) : super(key: key);

  @override
  State<Arcs> createState() => _ArcsState();
}

class _ArcsState extends State<Arcs> {
  @override
  Widget build(BuildContext context) {
    TimeRecordState state = context.findAncestorStateOfType<TimeRecordState>()!;

    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(painter: Arcs_Painter(state))),
      ],
    );
  }
}

class Arcs_Painter extends CustomPainter {
  Arcs_Painter(this.state);

  var state;

  double TimeToRadian(Duration t) =>
      degreeToRadian((t.inMinutes * 360 / (24 * 60)));

  // double HourToRadian(hour) => degreeToRadian((hour*360/24));
  double degreeToRadian(degree) => degree * math.pi / 180;

  Offset degreeToPoint(diam, angle) {
    var x = math.cos(angle) * diam;
    var y = math.sin(angle) * diam;
    x = (x + diam) / 2;
    y = (y + diam) / 2;
    var p = new Offset(x, y);
    // print(p);
    return p;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final myPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    
    Offset off = new Offset(15,15);
    Size inner = new Size(size.height - (off.dx*2), size.width - (off.dy*2));

    var rect = off & inner;
    state.records.forEach((R){
      R.angle_s = TimeToRadian(R.time_s) - math.pi / 2; //90도 보정.
      R.angle_e = TimeToRadian(R.time_e);
      myPaint.color = R.color;
      canvas.drawArc(rect, R.angle_s, R.angle_e, false, myPaint);
    });
    state.records.forEach((R){
      // Labeling(canvas, R.name, degreeToPoint(size.width, R.angle_s, R.angle_e));
      Labeling(canvas, R.name, degreeToPoint(inner.width,R.angle_s+R.angle_e));
    });

  }

  void Labeling(canvas, title, xy) {
    final textPainter = TextPainter(

      text: TextSpan(
          text: title,
          style: GoogleFonts.hiMelody(
            textStyle: TextStyle(color: Colors.black87,letterSpacing: .5, fontSize: 15),
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 3.0,
                // color: Color.fromARGB(255, 0, 0, 0),
                color: Colors.white70,
              ),
            ],

          )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout();
    textPainter.paint(canvas, xy);
  }

  @override
  bool shouldRepaint(Arcs_Painter old) {
    return false;
    // return state != old.state; //n이 달라지면 repaint.
  }
}
