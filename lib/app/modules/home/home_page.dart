import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:suapifba/app/modules/home/stores/manage_auth_store.dart';
import 'package:suapifba/app/shared/components/appbar_custom.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      required String imageFileName,
      required Function onTap}) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 2,
      child: InkWell(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset(
                "assets/images/$imageFileName",
                color: Colors.white.withOpacity(0.8),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Positioned(
              bottom: 5,
              left: 2,
              right: 2,
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                  imageFileName: "undraw_online_friends.svg",
                  onTap: () {
                    Modular.to.pushNamed("/virtualclass/");
                  },
                ),
                gridMenuItem(
                  title: "Horários de Aula",
                  imageFileName: "undraw_time_management.svg",
                  onTap: () {
                    Modular.to.pushNamed("/hour/");
                  },
                ),
                gridMenuItem(
                  title: "Notas e Faltas",
                  imageFileName: "undraw_report.svg",
                  onTap: () {
                    Modular.to.pushNamed("/reportcard/");
                  },
                ),
                gridMenuItem(
                  title: "Últimas Notícias",
                  imageFileName: "undraw_news.svg",
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
