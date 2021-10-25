import 'package:flutter/material.dart';

class ListTiles extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;
  final ValueChanged<int> onSelected;

  //const ListTiles({Key? key}) : super(key: key);
  const ListTiles(
      {required this.title,
      required this.icon,
      required this.onSelected,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        onSelected(index);
      },
    );
  }
}
