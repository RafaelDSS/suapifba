import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/home/stores/manage_auth_store.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';

import 'dart:ui' as ui;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Disposer _disposerManageAuth;
  bool actionVisibleLogout = false;
  final manageAuthStore = Modular.get<ManageAuthStore>();

  @override
  void initState() {
    super.initState();
    manageAuthStore.verifyToken();

    _disposerManageAuth = manageAuthStore.observer(
      onState: (state) {
        setState(() {
          actionVisibleLogout = true;
        });
      },
      onError: (error) async {
        Modular.to.navigate("/login/");
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _disposerManageAuth();
    manageAuthStore.destroy();
  }

  Widget gridMenuItem(
      {required String title,
      required IconData icon,
      required Function onTap}) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 2,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return ui.Gradient.linear(
                  const Offset(4.0, 24.0),
                  const Offset(24.0, 4.0),
                  [
                    Colors.green,
                    Colors.greenAccent,
                  ],
                );
              },
              child: Icon(icon, size: 30),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
        onTap: () => onTap(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefault(title: "SUAP", actionVisible: actionVisibleLogout),
      body: TripleBuilder<ManageAuthStore, Exception, bool>(
        store: manageAuthStore,
        builder: (context, triple) {
          if (triple.state) {
            return GridView.count(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 5),
              crossAxisCount: 2,
              children: [
                gridMenuItem(
                  title: "Turmas Virtuais",
                  icon: Icons.video_label,
                  onTap: () {
                    Modular.to.pushNamed("/virtualclass/");
                  },
                ),
                gridMenuItem(
                  title: "Horários de Aula",
                  icon: Icons.access_time,
                  onTap: () {
                    Modular.to.pushNamed("/hour/");
                  },
                ),
                gridMenuItem(
                  title: "Notas e Faltas",
                  icon: Icons.assessment,
                  onTap: () {
                    Modular.to.pushNamed("/reportcard/");
                  },
                ),
                gridMenuItem(
                  title: "Últimas Notícias",
                  icon: Icons.feed,
                  onTap: () {
                    Modular.to.pushNamed("/news/");
                  },
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
