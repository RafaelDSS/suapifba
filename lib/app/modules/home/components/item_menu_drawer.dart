import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_controller.dart';
import 'dart:ui' as ui;

class ItemMenuDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;
  final String token = Modular.get<HomeController>().token;

  ItemMenuDrawer({this.icon, this.title, this.route});

  BorderRadius borderRadius() {
    return BorderRadius.only(
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(20),
      topLeft: Radius.circular(20),
      topRight: Radius.circular(30),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: borderRadius(),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius(),
          ),
          title: Row(
            children: <Widget>[
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return ui.Gradient.linear(
                    Offset(4.0, 24.0),
                    Offset(24.0, 4.0),
                    [
                      Colors.grey,
                      Colors.white,
                    ],
                  );
                },
                child: Icon(icon),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            Modular.to.pushNamed(route, arguments: token);
          },
        ),
      ),
    );
  }
}
