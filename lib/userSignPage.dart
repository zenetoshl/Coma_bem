import 'package:flutter/material.dart';
import 'Home.dart';

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({this.onSignedIn});

  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: SafeArea(
          child: _showBody(),
        ),
      ),
    );
  }

  Widget _showBody() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 300.0,
                child: Image.asset(
                  "assets/initial.png",
                  fit: BoxFit.contain,
                ),
              ),
              _showEmailInput(),
              _showPasswordInput(),
              _showPrimaryButton(),
            ],
          ),
        ],
      )
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onChanged: (value) {
          setState(() {
            _email = value;
          });
        },
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        onChanged: (value) {
          setState(() {
            _password = value;
          });
        },
      ),
    );
  }

  Widget _showPrimaryButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: RaisedButton(
          color: Colors.grey,
          child: new Text(
            'Login',
          ),
          onPressed: ((_email == 'athena@gmail.com') && (_password == '123456'))
              ? () {
                  print(_password + _email);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }),
                  );
                }
              : () {
                  print(_password + _email);
                },
        ));
  }
}
