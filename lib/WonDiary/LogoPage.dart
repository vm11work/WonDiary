import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
                child: Text('상시 마음공부', style: TextStyle(fontSize: 35))

                // child: Text('상시 마음공부')
              // child: FittedBox(
              //     fit: BoxFit.fitHeight,
              //         child: Text('상시 마음공부')),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.green,
                ),
              ),
                child: Text('교환일기장', style: TextStyle(fontSize: 55))
              // child: FittedBox(
              //     fit: BoxFit.contain,
              //         child: Text('교환일기장', style: TextStyle(fontSize: 25)))
            ),
            ),
          Flexible(
            flex: 1,
            child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.green,
                    ),
                  ),
                margin: new EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Image.asset('assets/mainlogo.png')),
          )
        ],
      ),
    );
  }
}
