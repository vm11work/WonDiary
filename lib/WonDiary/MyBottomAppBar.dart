import 'package:flutter/material.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({Key? key, this.Set_Tab_state}) : super(key: key);
  final Set_Tab_state;

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  int _selectedIndex = 0;

  @override
  build(context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
          widget.Set_Tab_state(index);
        });
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '홈'),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_time_sharp), label: '시간'),
        BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_sharp), label: '유무념'),
        BottomNavigationBarItem(icon: Icon(Icons.checklist_sharp), label: '계문'),
        BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: '사람'),
      ],
    );
  }
}
