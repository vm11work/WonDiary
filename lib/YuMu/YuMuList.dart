import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Add_Dialog.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class YuMuList extends StatefulWidget {
  const YuMuList({Key? key}) : super(key: key);

  @override
  State<YuMuList> createState() => _YuMuListState();
}

class _YuMuListState extends State<YuMuList> {
  late List<YuMueData> _Data;

  @override
  void initState() {
    _Data = getYuMueData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('_Data');
    print(_Data[0].title);
    // void setyu(YuMueData data,int n){data.yu=n;}
    void AddNew(title)
    {
      setState(() {
        _Data.add(new YuMueData(title,0,0));
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Add_Dialog(AddNew:AddNew);
              });
        },
      ),
      body: Center(
        // color:Colors.red,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  child: Text(
                    '유무념 대조',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),

              Flexible(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  child: SizedBox(
                    width: 300,
                    child: ListView.separated(
                      itemCount: _Data.length,
                      itemBuilder: (c, i) {
                        return YuMu(data: _Data[i]);
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  List<YuMueData> getYuMueData() {
    return
      [
        YuMueData('일원상 경배', 15, 4),
        YuMueData('사시정진', 23, 3),
        YuMueData('유무념 대조', 3, 21),
      ];
  }


}

class YuMueData {
  YuMueData(this.title, this.yu, this.mu);

  final String title;
  int yu, mu;
}


class YuMu extends StatefulWidget {
  const YuMu({Key? key, required this.data}) : super(key: key);
  final YuMueData data;

  @override
  State<YuMu> createState() => _YuMuState();
}

class _YuMuState extends State<YuMu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Text(widget.data.title, style: TextStyle(fontSize: 25),),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('유념 : ${widget.data.yu.toString()}'),

                    Slider(
                      value: widget.data.yu.toDouble(),
                      max: 50,
                      activeColor: Colors.white70,
                      inactiveColor: Colors.grey,
                      label: widget.data.yu.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          widget.data.yu = value.toInt();
                        });
                      },
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('무념 : ${widget.data.mu.toString()}'),
                    Slider(
                      value: widget.data.mu.toDouble(),
                      max: 50,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,

                      // divisions: widget.data.yu,
                      label: widget.data.mu.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          widget.data.mu = value.toInt();
                        });
                      },
                    ),
                  ]),
            ]),

    );
  }
}
