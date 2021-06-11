import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suapifba/app/modules/home/components/box_animated.dart';
import 'package:suapifba/app/modules/home/utils/capitalize_word.dart';
import '../home_controller.dart';
import 'dart:ui' as ui;

class ListCardInfo extends StatelessWidget {
  final controller = Modular.get<HomeController>();

  Widget cardDefault({required String title, required List<Widget> children, double? width}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(60),
        ),
      ),
      child: Container(
        width: width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
              ),
            ),
            Column(children: children),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }

  Widget lineInfo({IconData? icon, required String title, String? content}) {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) {
            return ui.Gradient.linear(
              Offset(4.0, 24.0),
              Offset(24.0, 4.0),
              [
                Colors.green,
                Colors.transparent,
              ],
            );
          },
          child: Icon(icon),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${title.toUpperCase()}:",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                ),
                Builder(
                  builder: (_) {
                    if (content != null)
                      return Text(
                        titleCase(content.toLowerCase()),
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w300),
                      );
                    return BoxAnimated();
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .95;

    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              cardDefault(
                  title: 'Dados Gerais',
                  children: [
                    lineInfo(
                      icon: Icons.person,
                      title: 'Nome',
                      content: controller.data.vinculo!.nome,
                    ),
                    lineInfo(
                      icon: Icons.school,
                      title: 'Curso',
                      content: controller.data.vinculo!.curso,
                    ),
                    lineInfo(
                      icon: Icons.assignment_turned_in,
                      title: 'Matrícula',
                      content: controller.data.matricula,
                    )
                  ],
                  width: width),
              cardDefault(
                  title: 'Dados Acadêmicos',
                  children: [
                    lineInfo(
                      icon: Icons.location_on,
                      title: 'Campus',
                      content: controller.data.vinculo!.campus,
                    ),
                    lineInfo(
                      icon: Icons.done_outline,
                      title: 'Situação',
                      content: controller.data.vinculo!.situacao,
                    ),
                    lineInfo(
                      icon: Icons.people,
                      title: 'Cota',
                      content: controller.data.vinculo!.cotaMec,
                    )
                  ],
                  width: width)
            ],
          ),
        );
      },
    );
  }
}
