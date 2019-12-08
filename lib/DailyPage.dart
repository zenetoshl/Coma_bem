import 'package:flutter/material.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  //Variaveis
  var _bodyResponse;
  bool _smartCashAtivado =
  false; //Deve-se saber através do banco se a pessoa já ativou o SmartCash
  bool load = true;
  String _enderecoSmartCash; //Advém do banco
  final key = new GlobalKey<ScaffoldState>();
  String _valor = "Valor"; //Advém do banco
  String _moeda = "Moeda"; //Advém do banco
  String _situacao = "Situação"; //Advém do banco

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retriveData();
  }

  _retriveData() async {
    ///TODO: Caso necessite buscar algum dado
    setState(() {
      load = false;
    });
  }

  ///Header
  Widget _buildHeader(context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      height: MediaQuery.of(context).size.height * 0.27,
      padding: const EdgeInsets.only(right: 16, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: Icon(Icons.arrow_back_ios,
                    color: Color.fromRGBO(2, 153, 108, 1)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width * 0.34)),
                child: Image.asset(
                  "",///TODO: Coloca logo aq
                  width: 70,
                  height: 70,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Recomendação diaria",
                style: TextStyle(
                    color: Color.fromRGBO(2, 203, 108, 1),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[],
          )
        ],
      ),
    );
  }

  Widget _buildTextoIntroducao() {
    return new RichText(
      text: new TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: new TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold,fontFamily: "Poppins"),
        children: <TextSpan>[
          new TextSpan(text: 'Aproveite seu dia e faça uma boa alimentação para voce continuar no ritimo que sua dia merece :'),

        ],
      ),
    );
  }


  ///Historico SmartyPay


  _buildCardDigitalProduct( ) {
    var elevation;
    var color;

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 115.0,
        child: Card(
          elevation: 4,
          color: color,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Manhã ",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                ///TODO: Mudar manhã por um icon
                VerticalDivider(
                  color: Colors.green,
                ),
                Column(
                  children: <Widget>[
                    _buildTextoCard("food1", "food2", "food3", "food4"),
                  ],
                ),
                Column(
                  children: <Widget>[
                    _buildTextoCard("food1", "food2", "food3", "food4"),
                  ],
                ),
                VerticalDivider(
                  color: Colors.green,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total de caloria :",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("200",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextoCard(food1,food2,food3,food4) {
    return new RichText(
      text: new TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: new TextStyle(
            fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
        children: <TextSpan>[
          new TextSpan(text:food1+"\n"),
          new TextSpan(text:food2+"\n"),
          new TextSpan(text:food3+"\n"),
          new TextSpan(text:food4),
        ],
      ),
    );
  }



  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildTextoIntroducao(),
        SizedBox(height: 10),
        Container(
          margin: new EdgeInsetsDirectional.only(start: 5.0, end: 5.0),
          height: 2.0,
          color: Color.fromRGBO(2, 203, 108, 1),
        ),
        SizedBox(height: 10),
_buildCardDigitalProduct(),
_buildCardDigitalProduct(),
_buildCardDigitalProduct(),
      ],
    );
  }

  //Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            _buildHeader(context),
            Container(
                padding: EdgeInsets.only(top: 12, left: 8, right: 4),
                child: _buildBody()),
          ],
        ),
      );
  }
}