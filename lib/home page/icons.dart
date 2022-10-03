import 'package:flutter/material.dart';

class usedIcon extends StatelessWidget {
  const usedIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.grey[400],
      size: 30,
    );
  }
}
