import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';

class ParticipantesTabView extends StatelessWidget {
  final List<Participante>? participantes;

  const ParticipantesTabView({Key? key, this.participantes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: participantes!.map((item) {
            return Card(
              color: Colors.grey[300],
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(8),
                ),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      'http://suap.ifba.edu.br${item.foto}',
                      scale: 1.0),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    item.nome!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    const Text(
                      'Matricula:',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        item.matricula!,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
