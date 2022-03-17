import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Precept.dart';

class Precepts extends StatefulWidget {
  const Precepts({Key? key}) : super(key: key);

  @override
  State<Precepts> createState() => _PreceptsState();
}

class _PreceptsState extends State<Precepts> {
  // var IsTablet = false;

  // var titles =['살생읠 말며','도둑질을 말며','간음을 말며','간음을 말며',];
  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context).size.width > 600)
    //   IsTablet = true;
    // print(MediaQuery.of(context).size.width);
    // print(IsTablet);

    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // flex: 1,
                height: 100,
                margin: const EdgeInsets.all(10.0),
                child: logo
            ),
            Flexible(
              flex: 6,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  // width: 500,
                  // height: 500,
                  margin: MediaQuery.of(context).size.width > 600? EdgeInsets.all(20):EdgeInsets.all(10),
                  child: list()),
            ),
          ]),
    );

    // itemCount: 29,//titles.length,
    // itemBuilder: (context, i) {
    //   return Precept(l2:"살생을", index:i);
    // },
    // children: [
    //   Profile(),
    //   Profile(),
    // ],
  }
}

var logo = Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.green,
      ),
    ),
    child: Column(children: [
      Flexible(
          child: Image.asset('assets/Precepts_Img/s1.png',
              fit: BoxFit.fitHeight)),
      Text('보통급 십계', style: TextStyle(fontSize: 25))
    ]));

class list extends StatelessWidget {
  list({Key? key}) : super(key: key);

  late List<_Data> labels =
  [
    _Data(true, "살생", "을 말며","", 0),
    _Data(false,"도둑", "질을 말며",  " ",  1),
    _Data(false,"간음", "을 말며",  " ",  2),
    _Data( true, "술", "을 마시지",  "말며",  3),
    _Data(false,"잡기", "를 말며,",  " ",  4),
    _Data(false,"악한 말", "을 말며,",  " ",  5),
    _Data( true, "쟁투", "를 말며",  " ",  6),
    _Data(false,"공금", "을 범하여",  "쓰지 말며",  7),
    _Data( true, "심교간 금전", "을",  "여수하지 말며,",  8),
    _Data( true, "담배", "를",  "피우지 말라.",  9),


    _Data(false,"공중사", "를 단독히",  "처리하지 말며",  10),
    _Data(false,"다른사람의 과실", "을 말하지 말며",  " ",  11),
    _Data(false,"금은보패", "구하는 데",  "정신을 뺏기지 말며",  12),
    _Data(false,"의복", "을 빛나게",  "꾸미지 말며,",  13),
    _Data(false,"정당하지 못한 벗", "을",  "좇아 놀지 말며,",  14),
    _Data(false,"두 사람", "이",  "아울러 말하지 말며,",  15),
    _Data(false,"신용", "없지 말며",  " ",  16),
    _Data(false,"비단", "같이 꾸미는 말을",  "하지 말며,",  17),
    _Data( true, "때 아닌 때", "잠자지 말며,",  " ",  18),
    _Data(false,"예 아닌", "노래 부르고 춤추는 자리",  "에 좇아 놀지 말라.",  19),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
        childAspectRatio: 4,

      crossAxisCount: MediaQuery.of(context).size.width > 600? 2:1,

      shrinkWrap: true,
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      // padding: const EdgeInsets.all(20.0),
      children:  <Widget>[
        for(var i=0;i<labels.length;i++)


          Precept(isl1:labels[i].isl1, l2: labels[i].l2,l22:labels[i].l22,l3:labels[i].l3,index:labels[i].index),





          // Precept(labels[i].isl1, labels[i].l2,labels[i].l22,labels[i].l3,labels[i].index),
        // Divider(),
        // Divider(),
      ],
    );
  }
}

class _Data
{
  _Data(this.isl1, this.l2, this.l22,this.l3,this.index)
  {
  }
  bool isl1;
  String l2, l22,l3;
  int index;
}
