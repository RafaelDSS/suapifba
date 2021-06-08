import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_controller.dart';

import 'drawer_header_profile.dart';
import 'item_menu_drawer.dart';

class MenuDrawer extends StatelessWidget {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(10),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeaderProfile(),
              Container(
                height: MediaQuery.of(context).size.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ItemMenuDrawer(
                      icon: Icons.video_label,
                      title: 'Turmas Virtuais',
                      route: '/virtualclass',
                    ),
                    ItemMenuDrawer(
                      icon: Icons.access_time,
                      title: 'Horários de Aula',
                      route: '/hour',
                    ),
                    ItemMenuDrawer(
                      icon: Icons.assessment,
                      title: 'Notas e faltas',
                      route: '/reportcard',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
