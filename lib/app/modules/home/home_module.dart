import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/home_page.dart';
import 'package:suapifba/app/modules/home/repositories/manage_auth_repository.dart';
import 'package:suapifba/app/modules/home/stores/manage_auth_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ManageAuthRepository(Dio())),
    Bind((i) => ManageAuthStore(i.get(), i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
