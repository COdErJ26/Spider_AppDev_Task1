import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cards extends StatelessWidget {
  String names;
  Function todo;
  Icon iconForthis;
  Cards(this.names, this.todo, this.iconForthis);
  var a = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.amber,
        child: Center(
          child: SizedBox(
            width: 120.0,
            height: 30.0,
            child: ElevatedButton.icon(
              icon: Icon(
                iconForthis.icon,
                color: Colors.green,
                size: 20.0,
              ),
              onPressed: () {
                todo();
              },
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              label: Text(
                names,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
