import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/shared/repositories/localstorage_repository.dart';

PreferredSizeWidget appBarDefault(
    {String title = '', bool actionVisible = false}) {
  return AppBar(
    actions: <Widget>[
      Visibility(
        visible: actionVisible,
        child: IconButton(
          padding: const EdgeInsets.only(right: 15),
          icon: const Icon(Icons.logout),
          onPressed: () {
            Modular.get<LocalStorageRepository>().removeToken();
            Modular.to.navigate("/login/");
          },
        ),
      ),
    ],
    title: Text(title),
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
  );
}
