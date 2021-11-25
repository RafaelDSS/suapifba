import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/app_module.dart';
import 'package:suapifba/app/app_widget.dart';

void main() async {
  await Future.delayed(const Duration(seconds: 1));

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
