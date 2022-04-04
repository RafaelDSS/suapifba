import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MaterialTabView extends StatelessWidget {
  final List<MateriaisDeAula>? materiais;

  const MaterialTabView({Key? key, this.materiais}) : super(key: key);

  Widget infoCenter() {
    return const Center(
      child: Text(
        'Nenhum material cadastrado até o momento.',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget listMateriais() {
    return SingleChildScrollView(
      child: Column(
        children: materiais!.map(
          (item) {
            return ListTile(
              title: Text(item.descricao!),
              subtitle: Text(formatter.format(item.dataVinculacao!)),
              onTap: () async {
                final url = 'https://suap.ifba.edu.br${item.url}';
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
            );
          },
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: materiais!.isEmpty ? infoCenter() : listMateriais(),
    );
  }
}
