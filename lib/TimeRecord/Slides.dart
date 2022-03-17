import 'package:flutter/material.dart';
import 'package:wondiary/TimeRecord/TimeRecord.dart';
import 'trash/MyStore.dart';

import 'package:expandable/expandable.dart';

class Slides extends StatefulWidget {
  Slides({Key? key}) : super(key: key);

  @override
  State<Slides> createState() => _ListState();
}

class _ListState extends State<Slides> {
  var i = 0;

  @override
  Widget build(BuildContext context) {
    TimeRecordState state = context.findAncestorStateOfType<TimeRecordState>()!;

    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: state.records.length,
        itemBuilder: (c, i) {
          return MyItem(i: i);
        });
  }
}

class MyItem extends StatelessWidget {
  MyItem({Key? key, this.i}) : super(key: key);
  final i;

  @override
  Widget build(BuildContext context) {
    TimeRecordState state = context.findAncestorStateOfType<TimeRecordState>()!;
    ExpandableController  mycontroller;
    mycontroller = ExpandableController(initialExpanded: false);

    var R = state.records[i];
    return Column(
      children: [
        ExpandablePanel(
          controller: mycontroller,
          header: Row(
            children: [
              Icon(Icons.square_rounded, color: R.color),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(R.name),
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,5,0),
                child: Row(children: [
                  Text(R.TIMES),
                  Text("  ~  "),
                  Text(R.TIMEE),
                ]),
              ),
            ],
          ),
          // tapHeaderToExpand: true,
          // hasIcon: true,
          collapsed: SizedBox(),// Text(''),
          // collapsed: Text(''),
          expanded: Column(
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  state.setState(() {
                    R.ex.next = R.next;
                    R.next.ex = R.ex;
                    state.records.remove(R);

                    // state.num--;
                  });
                }, icon: Icon(Icons.delete, color:Colors.grey)),


                IconButton(onPressed: (){
                  state.setState(() {
                    //10분 이상 틈이 있을때만 아이콘 등장 함.
                    if(R.time_s.inMinutes+R.time_e.inMinutes+10>R.next.time_s.inMinutes)
                      return;
                    var New = R.embed();
                    state.records.add(New);
                    // state.num--;
                    New.log();
                    mycontroller.value=false;
                  });
                }, icon: Icon(Icons.add, color:Colors.grey)),
              ],
            ),


            Slider(
              activeColor: Colors.grey,
              inactiveColor: Colors.black12,

              value: R.time_s.inMinutes.toDouble(),
              min: R.ex.time_s.inMinutes.toDouble() +
                          R.ex.time_e.inMinutes.toDouble(),
              //(R.ex!.time_s.inHours+R.ex!.time_e.inHours)*60,

              max: R.next.time_s.inMinutes.toDouble() -
                      R.time_e.inMinutes.toDouble(),
              // 24*60,
              // divisions: 24,
              // label: R.time_s.round().toString(),
              onChanged: (double value) {
                state.setState(() {
                  // R.time_s = Duration(minutes: value.toInt());
                  R.time_s =Duration(minutes: value.toInt() - value.toInt() % 5);
                  state.num--; //num일때만 작동하는 문제..!
                });
              },
            ),
            Slider(
              activeColor: Colors.grey,
              inactiveColor: Colors.black12,
              value: R.time_e.inMinutes.toDouble(),
              min: 0,
              max: R.next.time_s.inMinutes.toDouble() -
                      (R.time_s.inMinutes.toDouble()),
              // divisions: 8,
              // label: R.time_e.round().toString(),
              onChanged: (double value) {
                state.setState(() {
                  // R.time_e = Duration(minutes: value.toInt());
                  if(value.toInt()<10)//최저 30분.
                    value = 10;
                  R.time_e =Duration(minutes: value.toInt() - value.toInt() % 5);
                  state.num--;
                });
              },
            ),
          ]),
        ),
        // Divider(height: 0,)
      ],
    );

    // return
    //   Column(
    //     // crossAxisAlignment: CrossAxisAlignment.start,
    //     // mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       Row(
    //         children: [
    //           Icon(Icons.square_rounded, color: R.color),
    //           Text(R.name),
    //           // Text(R.time_s.toString()),
    //           Text(R.TIMES),
    //           Text("  ~  "),
    //           Text(R.TIMEE),
    //           // Text(R.time_e.toString()),
    //         ],
    //       ),
    //       Column(children: [
    //         Slider(
    //           activeColor: Colors.grey,
    //           inactiveColor: Colors.black12,
    //
    //           value: R.time_s.inMinutes.toDouble(),
    //           min:
    //               // R.time_s.inMinutes.toDouble(),
    //
    //               R.ex == null
    //                   ? 0
    //                   : R.ex!.time_s.inMinutes.toDouble() +
    //                       R.ex!.time_e.inMinutes.toDouble(),
    //           //(R.ex!.time_s.inHours+R.ex!.time_e.inHours)*60,
    //
    //           max: R.next == null
    //               ? 24 * 60 - R.time_e.inMinutes.toDouble()
    //               : R.next!.time_s.inMinutes.toDouble() -
    //                   R.time_e.inMinutes.toDouble(),
    //           // 24*60,
    //           // divisions: 24,
    //           // label: R.time_s.round().toString(),
    //           onChanged: (double value) {
    //             state.setState(() {
    //               // if(R.ex!=null)
    //               // {
    //               //   // R.ex!.time_e-= R.time_s-value;
    //               //   R.ex!.time_s-= R.time_s-value;
    //               // }
    //
    //               // R.time_s = value;
    //               // R.time_s = Duration(minutes: value.toInt());
    //               R.time_s =
    //                   Duration(minutes: value.toInt() - value.toInt() % 10);
    //               state.num--; //num일때만 작동하는 문제..!
    //             });
    //           },
    //         ),
    //         Slider(
    //           activeColor: Colors.grey,
    //           inactiveColor: Colors.black12,
    //           value: R.time_e.inMinutes.toDouble(),
    //           min: 0,
    //           max: R.next == null
    //               ? 24 * 60 - (R.time_s.inMinutes.toDouble())
    //               : R.next!.time_s.inMinutes.toDouble() -
    //                   (R.time_s.inMinutes.toDouble()),
    //           // divisions: 8,
    //           // label: R.time_e.round().toString(),
    //           onChanged: (double value) {
    //             state.setState(() {
    //               // R.time_e = Duration(minutes: value.toInt());
    //               R.time_e =
    //                   Duration(minutes: value.toInt() - value.toInt() % 10);
    //               state.num--;
    //             });
    //           },
    //         ),
    //       ]),
    //       Divider()
    //     ]);
  }
}
