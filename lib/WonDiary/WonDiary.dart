import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LogoPage.dart';
import '../YuMu/YuMuList.dart';
import '../YuMu/YuMuList2.dart';

import '../TimeRecord/TimeRecord.dart';
import '../Precepts/Precepts.dart';

import 'MyBottomAppBar.dart';



class WonDiary extends StatelessWidget {
  const WonDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // textTheme: GoogleFonts.nanumBrushScriptTextTheme(),
          // textTheme: GoogleFonts.gowunBatangTextTheme(),
          // textTheme: GoogleFonts.nanumPenScriptTextTheme(),
          textTheme:  GoogleFonts.hiMelodyTextTheme(),
          //   textTheme: GoogleFonts(),




          // textTheme: GoogleFonts.nanumBrushScriptTextTheme(
          //   Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          // ),
          // textTheme: GoogleFonts.nanumBrushScript(),
          // Theme.of(context).textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          // ),
        ),
        home: MyApp()
    );
  }
}


class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var Tab_state = 0;
  Set_Tab_state(n)
  {
    setState(() {
      Tab_state = n;
    });
  }

  var names = ['김영숙', '홍길동', '피자집'];
  final style = TextStyle(fontSize:  62, fontWeight: FontWeight.normal);

  @override
  build(context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(),
          bottomNavigationBar: MyBottomAppBar(Set_Tab_state:Set_Tab_state),
          body:
          [LogoPage(), TimeRecord(), YuMuList(), Precepts(), Text('3')][Tab_state],
            // [LogoPage(), TimeTracking(), YuMuList(), Precepts(), Text('3')][Tab_state],


          // [LogoPage(), TimeTracking(), Text('44444'), Precepts(), Text('3')][Tab_state],


          // [Text('1'), Text('2'), Text('3')][Tab_state],
          // Precepts()
          // Text(Tab_state.toString()),
          // Precepts(),
        ),
      ),
    );
  }
}

// color: Color(0xff00ff19),
// home: Scaffold(
// appBar : AppBar( title: Text('앱임')),
// body : Container(
// child: Text('안녕')
// ),
// bottomNavigationBar: BottomAppBar(
// child : SizedBox(
// height: 70,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Icon(Icons.phone),
// Icon(Icons.message),
// Icon(Icons.contact_page),
// ],
// ),
// ),
// ),
// )
//Image.asset('assets/yang.PNG')
// home :  Icon(Icons.star)
//Text('좋아요 이제 할 수 있을 것 같아요. 고ㅜ맙습니다.')
