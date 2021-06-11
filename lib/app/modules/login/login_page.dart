import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';
import 'login_controller.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController controller = Modular.get<LoginController>();
  TextStyle style = TextStyle(fontFamily: 'Arial', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final image = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Container(
        child: Image.asset(
          'assets/images/logo-login.png',
          height: 100.0,
          // fit: BoxFit.cover,
        ),
      ),
    );

    final matriculaField = TextField(
      onChanged: (value) {
        controller.changeMatricula(value);
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Usuário',
        hintStyle: TextStyle(fontWeight: FontWeight.w300),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.green[400]!, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 2.0),
        ),
      ),
    );

    final passwordField = TextField(
      onChanged: (value) {
        controller.changePassword(value);
      },
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Senha',
        hintStyle: TextStyle(fontWeight: FontWeight.w300),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.green[400]!, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 2.0),
        ),
      ),
    );
    final loginbtn = SizedBox(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.green[400],
        child: Observer(
          builder: (_) {
            if (controller.isbuttonpress == false) {
              return Text(
                'Acessar',
                textAlign: TextAlign.center,
                style: style.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              );
            } else {
              return CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 2.0,
              );
            }
          },
        ),
        onPressed: () {
          if (controller.isbuttonpress == false) controller.submitForm();
        },
      ),
    );

    final rememberMeSwitch = Padding(
      padding: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Text(
            "Lembre-me",
            style: TextStyle(color: Colors.grey),
          ),
          Observer(builder: (_) {
            return Switch(
              value: controller.rememberMe,
              onChanged: (newValue) {
                controller.changeRememberMe(newValue);
              },
            );
          }),
        ],
      ),
    );

    return Scaffold(
      appBar: appBarDefault(title: 'Login') as PreferredSizeWidget?,
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            child: ListView(
              children: <Widget>[
                image,
                SizedBox(height: 20.0),
                Container(
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Observer(
                        builder: (_) {
                          return matriculaField;
                        },
                      ),
                      SizedBox(height: 40.0),
                      Observer(
                        builder: (_) {
                          return passwordField;
                        },
                      ),
                      // SizedBox(height: 40.0),
                      rememberMeSwitch,
                      Observer(
                        builder: (_) {
                          return loginbtn;
                        },
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
