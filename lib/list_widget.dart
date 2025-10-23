import 'package:flutter/material.dart';

class todoList extends StatelessWidget {
  const todoList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),

                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (bool? x) {}),
                    Text(""),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
