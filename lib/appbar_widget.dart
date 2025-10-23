import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget {
  const myAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.lightBlue,
      title: Row(
        children: [
          Expanded(child: Text("to Do List")),
          Container(child: Text("0% finished")),
        ],
      ),
    );
  }
}
