import 'package:flutter/material.dart';

class ListAdder extends StatefulWidget {
  const ListAdder({Key? key, this.name}) : super(key: key);
  final name;
  @override
  State<ListAdder> createState() => _ListAdderState();
}

class _ListAdderState extends State<ListAdder> {
  // var name = "김서원";

  var likes = 0;

  @override
  Widget build(context) {
    return ListTile(
      leading:Text(likes.toString()),
      title:Text(widget.name),
      trailing: TextButton(
        style: TextButton.styleFrom(
          textStyle: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          setState(() {
            likes+=1;
          });
        },
        child: Text('+'),
      ),
    );
  }
}