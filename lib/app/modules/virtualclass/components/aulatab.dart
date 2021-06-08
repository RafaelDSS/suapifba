import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';

class AulaTabView extends StatelessWidget {
  final List<Aula> aulas;

  AulaTabView({this.aulas});

  Widget listAulas() {
    return ListView(
      children: aulas.map(
        (item) {
          return ListTile(
            title: Text(item.conteudo),
            subtitle: Text(formatter.format(item.data)),
          );
        },
      ).toList(),
    );
  }

  Widget infoCenter() {
    return Center(
      child: Text('Nenhuma aula registrada até o momento.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: aulas.isEmpty ? infoCenter() : listAulas(),
    );
  }
}
