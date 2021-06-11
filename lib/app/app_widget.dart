import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  final String route;

  AppWidget(this.route);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SUAP',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: route,
    ).modular();
  }
}
