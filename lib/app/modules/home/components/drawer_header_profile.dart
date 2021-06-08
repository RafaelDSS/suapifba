import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_controller.dart';
import 'package:suapifba/app/modules/home/utils/capitalize_word.dart';

class DrawerHeaderProfile extends StatelessWidget {
  final controller = Modular.get<HomeController>();

  Widget circularAvatar(String pathImage) {
    return CircleAvatar(
      // radius: 43,
      backgroundColor: Colors.green[700],
      child: CircleAvatar(
        minRadius: 32,
        maxRadius: 32,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage('http://suap.ifba.edu.br$pathImage'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
          bottomLeft: Radius.circular(30),
        ),
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: <Color>[Colors.green, Colors.blue],
        // ),
      ),
      accountEmail: Observer(
        builder: (_) {
          if (controller.validateData()) {
            return Text(
              controller.data.matricula,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            );
          }
          return Text('');
        },
      ),
      accountName: Observer(
        builder: (_) {
          if (controller.validateData()) {
            return Text(
              titleCase(controller.data.vinculo.nome.toLowerCase()),
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            );
          }
          return Container();
        },
      ),
      currentAccountPicture: Observer(builder: (_) {
        if (controller.validateData()) {
          return circularAvatar(controller.data.urlFoto);
        }
        return circularAvatar("/static/comum/img/default.jpg");
      }),
    );
  }
}
