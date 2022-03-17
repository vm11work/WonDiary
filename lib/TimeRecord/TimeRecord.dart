import 'package:flutter/material.dart';

// import 'dart:ffi';
// import 'ArcSchedule.dart';

import 'Arcs.dart';
import 'Slides.dart';

// _TimeRecordState state = _TimeRecordState();
class TimeRecord extends StatefulWidget {
  bool _once = false;

  // TimeRecord({Key? key}) : super(key: key);
  @override
  TimeRecordState createState() => TimeRecordState();
// State<TimeRecord> createState() => state;
}

class record {
  static var _first = new record('시작', 0, 0, Colors.black54);
  static var _last = new record('끝', 23, 59, Colors.black54);


  record? _ex, _next;

  record get ex => _ex ?? _first;

  record get next => _next ?? _last;

  set ex(a) => _ex = a;

  set next(a) => _next = a;

  void log() => print(name + ":" + TIMES + "+(" + TIMEE);

  record embed() {
    print("enter");


    var a = time_s.inMinutes + time_e.inMinutes;
    var b = next.time_s.inMinutes - a;
    b = b>=60? 60: b;//1시간 기준.
    // var b = 1;
    var New = new record("끼워짐", a, b, Colors.brown);

    New.ex = this;
    New.next = next;
    next.ex = New;
    next = New;

    return New;
  }

  // int n;
  String name;
  Duration _time_s = new Duration(hours: 1, minutes: 0, seconds: 0);
  Duration _time_e = new Duration(hours: 1, minutes: 0, seconds: 0);
  late double angle_s, angle_e;

  format(Duration d) =>
      d.toString().split('.').first.padLeft(8, "0").substring(0, 5);

  String get TIMES => format(time_s);

  String get TIMEE => format(time_e);

  Duration get time_s => _time_s;

  Duration get time_e => _time_e;

  set time_s(a) => _time_s = a;

  set time_e(a) => _time_e = a;

  Color color;

  // record(this.name,this._time_s,this._time_e,this.color)
  record(this.name, a, b, this.color) {
    a = a<24? a*60 : a;//반드시 고쳐야함.
    b = b<8? b*60 : b;
    _time_s = Duration(minutes: a);
    _time_e = Duration(minutes: b);
  }
  // record(this.name, a, b, this.color,bool isHour) {
  //   _time_s = Duration(minutes: a * 60);
  //   _time_e = Duration(minutes: b * 60);
  // }
}

record? last;

class TimeRecordState extends State<TimeRecord> {
  late List<record> records; //= getrecords();

  getrecords() {
    records = [
      record('잠', 0, 4, Colors.black54),
      record('좌선', 5, 1, Colors.cyan),
      record('청소', 7, 1, Colors.orangeAccent),
      record('아침', 8, 1, Colors.grey),
      record('학과 공부', 9, 2, Colors.blue),
      record('점심', 12, 1, Colors.grey),
      record('도반', 13, 1, Colors.green),
      record('수업', 15, 1, Colors.blue),
      record('식사', 17, 1, Colors.grey),
      record('유투브', 19, 2, Colors.pinkAccent),
      record('기도', 21, 1, Colors.cyan),
      record('잠', 22, 1, Colors.black54),
    ];

    records[0].next = records[1];
    for (var i = 1; i < records.length - 1; i++) {
      records[i].ex = records[i - 1];
      records[i].next = records[i + 1];
    }
    records[records.length - 1].ex = records[records.length - 2];
  }

  @override
  void initState() {
    getrecords();
    print("init done");
    super.initState();
  }

  // double time_s = 1;
  // double time_e = 1;

  var num = 10;

  @override
  Widget build(BuildContext context) {
    print("start widget");
    return Center(
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width > 400
            ? 400
            : MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                // child: Placeholder(),
                child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    padding: EdgeInsets.all(5),
                    child: Arcs()),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: Container(
                      // height: double.infinity,
                      width: double.infinity,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
                      child: Slides())),
              Builder(builder: (context) {
                return Column(children: [
                  Text(num.toString()),
                  // Text(num.toString()),
                  TextButton(
                      child: Text('눌르셈'),
                      onPressed: () {
                        setState(() {
                          num += 2;
                        });
                      })
                ]);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// Column(
// children: [
// Flexible(
// flex: 1,
// child: Container(
// width: 400,
// height: 400,
// decoration:
// BoxDecoration(border: Border.all(color: Colors.blueAccent)),
// child: CustomPaint(
// painter: ArcSchedule(5, "글자"),
// ),
// ),
// ),
// Flexible(flex: 2, child: Text('하단바'))
// ],
// ));
