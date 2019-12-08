import 'package:flutter/material.dart';

import 'TimelineBar.dart';

class ComidasPage extends StatefulWidget {
  @override
  _ComidasPageState createState() => _ComidasPageState();
}

class _ComidasPageState extends State<ComidasPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: ListView(children: <Widget>[
          Container(
            child: Text(
              "Strogonoff: 500 Calorias",
              style: TextStyle(color: Colors.white, fontSize: 25)
            ), 
            decoration: BoxDecoration(
              color: Colors.cyan,
              border: Border.all(
                color: Colors.cyan,
                width: 25
              )
            ),
          ),
          Image.network('https://www.natue.com.br/natuelife/wp-content/uploads/2016/01/Strogonoff.jpg'),
          Container(
            child: Text(
              "Tradicional: 300 Calorias",
              style: TextStyle(color: Colors.white, fontSize: 25)
            ), 
            decoration: BoxDecoration(
              color: Colors.cyan,
              border: Border.all(
                color: Colors.cyan,
                width: 25
              )
            ),
          ),
          Image.network('https://www.receiteria.com.br/wp-content/uploads/receitas-de-almoco-rapido-1-730x449.jpg'),
          
        ],),
      ),
    );
  }
}
