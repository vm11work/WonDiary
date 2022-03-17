import 'package:flutter/material.dart';

class Add_Dialog extends StatelessWidget {
  Add_Dialog({Key? key,this.AddNew}) : super(key: key);

  final AddNew;
  final myController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
          height: 300,
          child: Column(
            children: [
              Text("유무념 조목은? "),
              TextField(controller: myController),
              TextButton(onPressed: (){
                AddNew(myController.text);
                Navigator.pop(context);
              }, child: Text('완료')),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text('취소')),
            ],
          ),
      ),
    );
  }
}
