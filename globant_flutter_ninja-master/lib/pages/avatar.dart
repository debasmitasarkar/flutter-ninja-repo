import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String logo;
  Avatar(this.logo);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      width: 34.0,
      child: CircleAvatar(radius: 30, backgroundImage: AssetImage(logo)),
    );
  }
}
