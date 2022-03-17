// import 'package:flutter/material.dart';
//
// class YuMueData {
//   YuMueData(this.title, this.yu,this.mu);
//   final String title;
//   final int yu,mu;
// }
//
// class YuMu extends StatefulWidget {
//   const YuMu({Key? key, required this.data}) : super(key: key);
//   final YuMueData data;
//
//   @override
//   State<YuMu> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<YuMu> {
//   final List<int> _items = List<int>.generate(10, (int index) => index);
//
//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme colorScheme = Theme.of(context).colorScheme;
//     double _currentSliderValue =7;
//
//     return ReorderableListView(
//       padding: const EdgeInsets.symmetric(horizontal: 40),
//       children: <Widget>[
//         for (int index = 0; index < _items.length; index += 1)
//           ListTile(
//             key: Key('$index'),
//             title: Column(children: [
//               Text('Item ${_items[index]}'),
//                 Slider(
//                   value: _currentSliderValue,
//                   max: 10,
//                   divisions: 5,
//                   label: _currentSliderValue.round().toString(),
//                   onChanged: (double value) {
//                     setState(() {
//                       _currentSliderValue = value;
//                     });
//                   },
//                 )
//             ]),
//           ),
//       ],
//       onReorder: (int oldIndex, int newIndex) {
//         setState(() {
//           if (oldIndex < newIndex) {
//             newIndex -= 1;
//           }
//           final int item = _items.removeAt(oldIndex);
//           _items.insert(newIndex, item);
//         });
//       },
//     );
//   }
// }
//
//
