import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/components/list_card_info.dart';
import 'package:suapifba/app/modules/home/components/menu_drawer.dart';
import 'package:suapifba/app/modules/home/home_controller.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = Modular.get<HomeController>();

  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerScrimColor: Colors.transparent,
      appBar: appBarDefault() as PreferredSizeWidget?,
      drawer: MenuDrawer(),
      body: Container(
        color: Colors.grey[100],
        alignment: Alignment.center,
        child: ListCardInfo(),
      ),
    );
  }
}
