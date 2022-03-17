import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Precept extends StatefulWidget {
  const Precept(
      {Key? key, this.isl1: false, this.l2, this.l22, this.l3, this.index})
      : super(key: key);

  // final name;

  final isl1;
  final l2, l3, l22;
  final index;

  @override
  State<Precept> createState() => _PreceptState();
}

class text_container extends StatelessWidget {
  const text_container({Key? key, this.widget}) : super(key: key);
  final widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      //  margin: EdgeInsets.fromLTRB(10,0,10,0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        Text(widget.isl1 ? "연고없이" : ""),
        // style: GoogleFonts.nanumBrushScript(fontSize: 15)),
        Row(children: [
          Text(
            widget.l2 ?? "", style: TextStyle(fontSize: 25),
            // style: GoogleFonts.nanumBrushScript(fontSize: 25),
          ),
          Text(widget.l22 ?? ""
              // style: GoogleFonts.nanumBrushScript(fontSize: 15),
              ),
        ]),
        // if (widget.l3 != "")
        Text(widget.l3 ?? ""
            // style: GoogleFonts.nanumBrushScript(fontSize: 15),
            ),
      ]),
    );
  }
}

class _PreceptState extends State<Precept> {
  // var name = "김서원";
  var likes = 0;



  @override
  Widget build(context) {
    //
    // print(MediaQuery.of(context).size.width);

    abc(n){n+=1;}

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.orange,
        ),
      ),
      width: 200,//list view 안에 있어서 적용되지 않는듯.
      // width: IsTablet? 200 : 150,
      height: 50,
      child: InkWell(
        onTap: () {
          setState(() {
            likes = likes == 99 ? 0 : likes + 1;
          });
        },
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.blue,
                ),
              ),
              child: Image.asset("assets/Precepts_Img/" +
                  (widget.index + 1).toString() +
                  ".png",
              fit:BoxFit.fitWidth),
            ),
            Expanded(
                flex : 3,
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.blue,
                      ),
                    ),
                    child: text_container(widget: widget))),

            // P_Label(name : widget.l2+widget.l3),
            Container(

              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.green,
                ),
              ),
              child: Row(
                  // width: 100,
                  children: [
                SizedBox(
                  width: 30,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      // backgroundColor: Colors.red,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        likes = likes == 0 ? 0 : likes - 1;
                      });
                    },
                    child: Text('-'),
                  ),
                ),
                Text(likes.toString()),
                SizedBox(
                  width: 30,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        likes = likes == 99 ? 0 : likes + 1;
                      });
                    },
                    child: Text('+'),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class P_Label extends StatelessWidget {
  const P_Label({Key? key, this.name}) : super(key: key);
  final name;

  @override
  Widget build(BuildContext context) {
    return Text("" + name);
  }
}
