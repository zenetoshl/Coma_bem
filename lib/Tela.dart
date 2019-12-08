import 'package:flutter/material.dart';
import 'Comidas.dart';

import 'TimelineBar.dart';

class TelaPage extends StatefulWidget {
  @override
  _TelaPageState createState() => _TelaPageState();
}

class _TelaPageState extends State<TelaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              child: Text("Café da manhã",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  border: Border.all(color: Colors.cyan, width: 40)),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text("Almoço",
                      style: TextStyle(color: Colors.black87, fontSize: 25)),
                  FlatButton(
                    color: Colors.white,
                    child: Text(''),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ComidasPage();
                        }),
                      );
                    },
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 40),
              ),
            ),
            Container(
              child: Text("Café da tarde",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  border: Border.all(color: Colors.cyan, width: 40)),
            ),
            Container(
              child: Text("Janta",
                  style: TextStyle(color: Colors.black87, fontSize: 25)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 40)),
            ),
          ],
        ),
      ),
    );
  }
}
