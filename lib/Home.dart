import 'package:flutter/material.dart';
import 'DailyPage.dart';
import 'Tela.dart';
import 'TimelineBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TimelineBar(
                count: 7,
                onChange: (i) => this.setState(() => this.tab = i),
              ),
              Expanded(
                child: TelaPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
