import 'package:flutter/material.dart';
import 'package:suapifba/app/modules/virtualclass/models/virtualclass_model.dart';

class ParticipantesTabView extends StatelessWidget {
  final List<Participante>? participantes;

  ParticipantesTabView({this.participantes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: participantes!.map((item) {
          return Card(
            color: Colors.grey[300],
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
                topLeft: Radius.circular(25),
                topRight: Radius.circular(8),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
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
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
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
    );
  }
}
