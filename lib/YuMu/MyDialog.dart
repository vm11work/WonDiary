import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key, this.title}) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
          height: 300,
          child: Column(
            children: [
              Text(title),
              TextField(),
              TextButton(onPressed: (){}, child: Text('완료')),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text('취소')),
            ],
          ),
      ),
    );
  }
}
