import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';

class AulaTabView extends StatelessWidget {
  final List<Aula>? aulas;

  const AulaTabView({Key? key, this.aulas}) : super(key: key);

  Widget listAulas() {
    return SingleChildScrollView(
      child: Column(
        children: aulas!.map(
          (item) {
            return ListTile(
              title: Text(item.conteudo!),
              subtitle: Text(formatter.format(item.data!)),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget infoCenter() {
    return const Center(
      child: Text(
        'Nenhuma aula registrada até o momento.',
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: aulas!.isEmpty ? infoCenter() : listAulas(),
    );
  }
}
